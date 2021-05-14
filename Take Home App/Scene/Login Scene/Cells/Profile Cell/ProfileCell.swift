import UIKit

class ProfileCell: UITableViewCell {

    // MARK: Properties
    static let reuseID = "ProfileCell"
    var buttonAction: (() -> Void)? = nil

    
    // MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    // MARK: Override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: IBActions
    @IBAction func logoutButtonTapped(_ sender: Any) {
        buttonAction?()
    }
}

// MARK: - Methods
extension ProfileCell {
    
    func setupViews() {
        logoutButton.layer.cornerRadius = 5
    }
}
