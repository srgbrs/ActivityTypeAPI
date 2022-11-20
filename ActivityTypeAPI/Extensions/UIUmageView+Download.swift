import Foundation
import UIKit

extension UIImageView {
    func download(from url: String) {
        let urlString = URL(string: url)!

        DispatchQueue.global().async {
            // Fetch Image Data
            if let data = try? Data(contentsOf: urlString) {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self.image = UIImage(data: data)!
                }
            }
        }
    }
}
