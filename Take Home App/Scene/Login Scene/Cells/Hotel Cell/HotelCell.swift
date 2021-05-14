import UIKit
import SDWebImage

class HotelCell: UITableViewCell {
    
    // MARK: Properties
    static let reuseID = "HotelCell"
    
    // MARK: IBOutlets
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
}

// MARK: - Methods
extension HotelCell {
    
    func setup(hotel: Hotel) {
        thumbnailImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        thumbnailImageView.sd_setImage(with: URL(string: hotel.image?.small ?? ""), placeholderImage: UIImage(systemName: "paperclip"))
        titleLabel.text = hotel.title
        addressLabel.text = hotel.address
    }
    
    private func setupViews() {
        selectionStyle = .none
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.height / 2
    }
}
