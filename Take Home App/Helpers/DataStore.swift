import Foundation

class DataStore {
    
    static let shared  = DataStore()
    
    private init(){}
    
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
