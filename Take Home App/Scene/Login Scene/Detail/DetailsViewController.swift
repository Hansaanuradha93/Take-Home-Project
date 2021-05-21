import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    // MARK: Properties
    public class var storyboardName: String {
        return "Login"
    }
    
    static func create(viewModel: DetailsViewModel) -> DetailsViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: DetailsViewController.self)) as? DetailsViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    var viewModel: DetailsViewModel!
    
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Methods
private extension DetailsViewController {
    
    @objc func addTapped() {
        let controller = MapViewController.create(viewModel: MapViewModel(hotel: viewModel.hotel))
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func setupViews() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.appColor(.darkGreen)
        title = viewModel.title

        var image = Asserts.circleFill
        image = image.withRenderingMode(.alwaysTemplate)
        image.withTintColor(.black)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(addTapped))

        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: URL(string: viewModel.hotel.image?.small ?? ""), placeholderImage: Asserts.paperClip)
        titleLabel.text = viewModel.hotel.title ?? ""
        descriptionLabel.text = viewModel.hotel.description ?? ""
    }
}
