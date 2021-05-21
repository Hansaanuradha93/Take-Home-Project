import Foundation

final class DetailsViewModel {
    
    // MARK: Properties
    let title = Strings.details
    var hotel: Hotel
    
    // MARK: Initializers
    init(hotel: Hotel) {
        self.hotel = hotel
    }
}
