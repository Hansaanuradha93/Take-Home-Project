import Foundation
import MapKit

final class MapViewModel {
    
    // MARK: Properties
    let title = "Map"
    var hotel: Hotel!
    var location: CLLocation!
    
    // MARK: Initializers
    init(hotel: Hotel) {
        let latitude = Double(hotel.latitude ?? "") ?? 0
        let longitude = Double(hotel.longitude ?? "") ?? 0
        self.hotel = hotel
        self.location = CLLocation(latitude: latitude, longitude: longitude)
    }
}
