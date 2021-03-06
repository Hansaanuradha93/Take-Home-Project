import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
    public class var storyboardName: String {
        return "Login"
    }
    
    static func create(viewModel: LoginViewModel) -> LoginViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    var viewModel: LoginViewModel!
    
    // MARK: IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: IBActions
    @IBAction func loginbuttonTapped(_ sender: Any) {
        loginWithFacebook()
    }
}

// MARK: - Methods
private extension LoginViewController {
    
    func loginWithFacebook() {
        viewModel.loginWithFacebook(controller: self) { [weak self] status, message, user in
            guard let self = self else { return }
            if status {
                guard let user = user else { return }
                user.saveUser()
                self.navigateToHotelList()
            } else {
                self.presentAlert(title: Strings.failed, message: message, buttonTitle: Strings.ok)
            }
        }
    }
    
    func navigateToHotelList() {
        let controller = HotelListViewController.create(viewModel: HotelListViewModel())
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func setupUI() {
        navigationController?.navigationBar.barTintColor = UIColor.appColor(.darkGreen)
        title = viewModel.title
        loginButton.layer.cornerRadius = 5
    }
}
