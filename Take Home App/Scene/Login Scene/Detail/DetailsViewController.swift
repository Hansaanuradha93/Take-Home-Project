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
    
    func setupViews() {
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: URL(string: viewModel.hotel.image?.small ?? ""))
        titleLabel.text = viewModel.hotel.title ?? ""
        descriptionLabel.text = viewModel.hotel.description ?? ""
    }
}
