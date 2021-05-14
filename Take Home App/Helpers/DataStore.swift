import Foundation

class DataStore {
    
    // MARK: Properties
    static let shared  = DataStore()
    
    // MARK: Initializers
    private init(){}
}

// MARK: - Methods
extension DataStore {
    
    func setFullName(value: String) {
        UserDefaults.standard.set(value, forKey: "full-name")
    }
    
    func getFullName() -> String? {
        return UserDefaults.standard.string(forKey: "full-name")
    }
    
    func setEmail(value: String) {
        UserDefaults.standard.set(value, forKey: "email")
    }
    
    func getEmail() -> String? {
        return UserDefaults.standard.string(forKey: "email")
    }
    
    func removeAllData(){
        UserDefaults.standard.removeObject(forKey: "full-name")
        UserDefaults.standard.removeObject(forKey: "email")
    }
}
