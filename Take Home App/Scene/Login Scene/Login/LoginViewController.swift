import UIKit
import FBSDKLoginKit

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
        
        let loginButton = FBLoginButton()
        loginButton.permissions = ["public_profile", "email"]
        loginButton.center = view.center
        view.addSubview(loginButton)
        
//        firstNameTextField.autocorrectionType = .no
//        emailTextField.keyboardType = .emailAddress
//        emailTextField.autocorrectionType = .no
//        passwordTextField.isSecureTextEntry = true
//        passwordTextField.autocorrectionType = .no
//        signupButton.isEnabled = false
    }
}


//// Swift
////
//// Add this to the header of your file, e.g. in ViewController.swift
//
//import FBSDKLoginKit
//
//// Add this to the body
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let loginButton = FBLoginButton()
//        loginButton.center = view.center
//        view.addSubview(loginButton)
//    }
//}
