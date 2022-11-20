import Foundation
import UIKit

class BaseRouter {
    init(sourceViewController: UIViewController) {
        self.sourceViewController = sourceViewController
    }

    weak var sourceViewController: UIViewController?
}
