import Foundation

final class DetailsViewModel {
    
    // MARK: Properties
    let title = "Details"
    var hotel: Hotel
    
    // MARK: Initializers
    init(hotel: Hotel) {
        self.hotel = hotel
    }
}
