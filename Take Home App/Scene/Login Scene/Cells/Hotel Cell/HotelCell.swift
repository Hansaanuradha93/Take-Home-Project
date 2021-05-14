import UIKit

class HotelCell: UITableViewCell {
    
    // MARK: Properties
    static let reuseID = "HotelCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Methods
extension HotelCell {
    
    func setup() {
        backgroundColor = .red
    }
}
