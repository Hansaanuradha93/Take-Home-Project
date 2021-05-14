import Foundation
import FBSDKLoginKit

final class HotelListViewModel {
    
    let title = "List View"
    
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
}

// MARK: - Methods
extension HotelListViewModel {
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func logOut(completion: @escaping(_ status: Bool) -> Void) {
        let loginManager = LoginManager()
        loginManager.logOut()
        completion(true)
    }
}
