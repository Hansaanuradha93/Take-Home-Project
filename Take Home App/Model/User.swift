import Foundation

struct User {
    
    // MARK: Properties
    let fullName: String
    let email: String
    
    // MARK: Initializers
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
}

// MARK: - Methods
extension User {
    
    func saveUser() {
        DataStore.shared.setFullName(value: fullName)
        DataStore.shared.setEmail(value: email)
    }
}
