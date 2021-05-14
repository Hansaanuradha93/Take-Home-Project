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

    
    // MARK: Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Methods
private extension LoginViewController {
    
    func setupUI() {
        navigationController?.navigationBar.barTintColor = UIColor.appColor(.darkGreen)
//        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Login"
        
//        firstNameTextField.autocorrectionType = .no
//        emailTextField.keyboardType = .emailAddress
//        emailTextField.autocorrectionType = .no
//        passwordTextField.isSecureTextEntry = true
//        passwordTextField.autocorrectionType = .no
//        signupButton.isEnabled = false
    }
}
