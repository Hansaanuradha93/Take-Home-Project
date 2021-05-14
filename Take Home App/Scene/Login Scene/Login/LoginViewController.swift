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
        viewModel.loginWithFacebook(controller: self) { [weak self] status, message in
            guard let self = self else { return }
            if status {
                // TODO: go to next screen
                print(message)
            } else {
                self.presentAlert(title: "Failed", message: message, buttonTitle: "Ok")
            }
        }
    }
    
    func setupUI() {
        navigationController?.navigationBar.barTintColor = UIColor.appColor(.darkGreen)
        title = viewModel.title
        loginButton.layer.cornerRadius = 5
    }
}
