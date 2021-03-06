import Foundation
import FBSDKLoginKit

final class LoginViewModel {
    
    // MARK: Properties
    let title = Strings.login
    private let loginManager = LoginManager()
}

// MARK: - Methods
extension LoginViewModel {
    
    func loginWithFacebook(controller: UIViewController, completion: @escaping(_ status: Bool, _ message: String, _ user: User?) -> Void) {
        let permissions = ["public_profile","email", "name"]
                
        loginManager.logIn(permissions: permissions, from: controller) { (result, error) in
            // Check for error
            guard error == nil else {
                print(error!.localizedDescription)
                completion(false, error!.localizedDescription, nil)
                return
            }
            
            // Check for cancel
            guard let result = result, !result.isCancelled else {
                print(Strings.userCanceledLogin)
                completion(false, Strings.userCanceledLogin, nil)
                return
            }
                      
            guard let accessToken = FBSDKLoginKit.AccessToken.current else { return }
            let graphRequest = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                          parameters: ["fields": "email, name"],
                                                          tokenString: accessToken.tokenString,
                                                          version: nil,
                                                          httpMethod: .get)
            graphRequest.start { (connection, result, error) -> Void in
                if error != nil {
                    print(error!.localizedDescription)
                    completion(false, Strings.profileDataNotFound, nil)
                }
                
                if let result = result {
                    let data = result as! [String : AnyObject]
                    let user = User(data: data)
                    
                    // Successfully logged in
                    completion(true, Strings.loggedInSuccessfully, user)
                }
            }
        }
    }
}
