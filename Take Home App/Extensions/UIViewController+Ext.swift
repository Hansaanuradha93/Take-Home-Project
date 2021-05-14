import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String, buttonTitle: String, action: ((_ alertAction: UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: action)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
