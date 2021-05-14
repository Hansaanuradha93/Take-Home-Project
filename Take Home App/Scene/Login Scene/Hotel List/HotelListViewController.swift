import UIKit
import FBSDKLoginKit

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

    // MARK: Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: remove this code
        let loginManager = LoginManager()
        loginManager.logOut()
    }
}
