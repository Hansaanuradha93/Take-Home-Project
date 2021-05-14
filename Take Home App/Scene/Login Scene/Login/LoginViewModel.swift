import Foundation
import FBSDKLoginKit

final class LoginViewModel {
    
    let title = "Login"
    private let loginManager = LoginManager()

    
    func loginWithFacebook(controller: UIViewController, completion: @escaping(_ status: Bool, _ message: String) -> Void) {
        let permissions = ["public_profile","email"]
                
        loginManager.logIn(permissions: permissions, from: controller) { (result, error) in
            // Check for error
            guard error == nil else {
                print(error!.localizedDescription)
                completion(false, error!.localizedDescription)
                return
            }
            
            // Check for cancel
            guard let result = result, !result.isCancelled else {
                print("User cancelled login")
                completion(false, "User cancelled login")
                return
            }
          
            // Successfully logged in
            print("logged in")
            completion(true, "Succusfully Logged in")
        }
    }
}
