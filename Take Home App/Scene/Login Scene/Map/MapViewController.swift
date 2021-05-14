import UIKit

class MapViewController: UIViewController {

    // MARK: Properties
    public class var storyboardName: String {
        return "Login"
    }
    
    static func create(viewModel: MapViewModel) -> MapViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: MapViewController.self)) as? MapViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    var viewModel: MapViewModel!
    
    // MARK: IBOutlets
    
    // MARK: Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupViews()
    }
}
