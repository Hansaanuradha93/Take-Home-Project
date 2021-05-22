import Foundation
import FBSDKLoginKit

final class HotelListViewModel {
    
    // MARK: Properties
    let title = Strings.listView
    var user: User? = nil
    var hotels: [Hotel] = []
    
    enum SectionType {
        case Profile
        case Hotel
    }
    
    struct Section {
        var sectionType: SectionType
        var index: Int
    }
    
    lazy var sections: [Section] = {
        var data = [Section]()
        
        let first = Section(sectionType: .Profile, index: 0)
        let second = Section(sectionType: .Hotel, index: 1)

        data.append(first)
        data.append(second)
        
        return data
    }()
    
    // MARK: Initializers
    init() {
        guard let fullName = DataStore.shared.getFullName(),
              let email = DataStore.shared.getEmail() else { return }
        self.user = User(fullName: fullName, email: email)
    }
}

// MARK: - Methods
extension HotelListViewModel {
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfHotels() -> Int {
        return hotels.count
    }
    
    func logOut(completion: @escaping(_ status: Bool) -> Void) {
        let loginManager = LoginManager()
        loginManager.logOut()
        completion(true)
    }
    
    func fetchHotels(completion: @escaping(_ status: Bool, _ message: String) -> Void) {
        NetworkManager.shared.getHotels { result in
            switch result {
            case .success(let hotels):
                self.hotels = hotels
                completion(true, "")
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
        }
    }
}
