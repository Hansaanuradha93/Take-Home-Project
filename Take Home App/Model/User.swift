import Foundation

struct User {
    let fullName: String
    let email: String
    
    init(data: [String : AnyObject]) {
        let firstName = data["first_name"] as? String ?? ""
        let lastName = data["last_name"] as? String ?? ""
        self.fullName = "\(firstName) \(lastName)"
        self.email = data["email"] as? String ?? ""
    }
    
    init(fullName: String, email: String) {
        self.fullName = fullName
        self.email = email
    }
    
    func saveUser() {
        DataStore.shared.setFullName(value: fullName)
        DataStore.shared.setEmail(value: email)
    }
}
