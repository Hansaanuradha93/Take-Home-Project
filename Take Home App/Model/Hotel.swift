import Foundation

struct Hotel: Codable, Hashable {
    
    // MARK: Properties
    var image: Thumbnail?
    var title: String?
    var address: String?
    var description: String?
    var latitude: String?
    var longitude: String?
}

struct Thumbnail: Codable, Hashable {
    
    // MARK: Properties
    var small: String?
    var medium: String?
    var large: String?
}
