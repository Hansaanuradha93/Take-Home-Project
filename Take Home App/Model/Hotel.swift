import Foundation

struct Hotel: Codable, Hashable {
    var image: Thumbnail?
    var title: String?
    var address: String?
    var description: String?
    var latitude: String?
    var longitude: String?
}

struct Thumbnail: Codable, Hashable {
    var small: String?
    var medium: String?
    var large: String?
}
