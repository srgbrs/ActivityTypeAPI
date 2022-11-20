import UIKit
import Foundation

final class SportsListRouter : BaseRouter {
    func showSportList(viewModel: ActivityModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let screen = storyboard.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController
        
        screen!.viewModel = DetailedViewModel(activity: viewModel)
     
        sourceViewController?.navigationController?.pushViewController(screen!, animated: true)
    }
}


final class DetailedRouter : BaseRouter {
    func showDetail() {
        _ = SportsListViewController()
        sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
