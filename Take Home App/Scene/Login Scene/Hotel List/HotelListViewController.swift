import UIKit

class HotelListViewController: UIViewController {
    
    // MARK: Properties
    public class var storyboardName: String {
        return "Login"
    }
    
    static func create(viewModel: HotelListViewModel) -> HotelListViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: HotelListViewController.self)) as? HotelListViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    var viewModel: HotelListViewModel!
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchHotels()
    }
}

// MARK: - UITableViewDataSource
extension HotelListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.sections[section]
        
        switch section.sectionType {
        case .Profile:
            return 1
        case .Hotel:
            return viewModel.numberOfHotels()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.sections[indexPath.section]
        
        switch section.sectionType {
        case .Profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.reuseID, for: indexPath) as! ProfileCell
            
            if let user = viewModel.user {
                cell.setup(user: user)
            }
            
            cell.buttonAction = {
                self.logout()
            }
            return cell
        case .Hotel:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelCell.reuseID, for: indexPath) as! HotelCell
            if viewModel.hotels.count > 0 {
                cell.setup(hotel: viewModel.hotels[indexPath.row])
            }
            return cell
        }
    }
}

// MARK: -  UITableViewDelegate
extension HotelListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hotel = viewModel.hotels[indexPath.row]
        let controller = DetailsViewController.create(viewModel: DetailsViewModel(hotel: hotel))
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = viewModel.sections[indexPath.section]
        
        switch section.sectionType {
        case .Profile:
            return 150
        case .Hotel:
            return 100
        }
    }
}

// MARK: - Methods
private extension HotelListViewController {
    
    func fetchHotels() {
        viewModel.fetchHotels { [weak self] status, message  in
            guard let self = self else { return }
            if status {
                DispatchQueue.main.async { self.tableView.reloadData() }
            }
        }
    }
    
    func logout() {
        viewModel.logOut { [weak self] status in
            if status {
                // TODO: change this
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func setupUI() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.appColor(.darkGreen)
        title = viewModel.title
        
        // Registed table view cells
        tableView.register(ProfileCell.self)
        tableView.register(HotelCell.self)

        // Setup table view datasource and delegate
        tableView.delegate = self
        tableView.dataSource = self
    }
}
