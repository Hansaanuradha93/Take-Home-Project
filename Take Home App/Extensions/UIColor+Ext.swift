import UIKit

enum AssetsColor: String {
    case darkGreen = "DarkGreen"
}


extension UIColor {
    static func appColor(_ color: AssetsColor) -> UIColor { return UIColor(named: color.rawValue)! }
}
