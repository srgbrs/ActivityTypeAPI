import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var detailedLabel: UILabel!
    @IBOutlet weak var detailedImageView: UIImageView!
    
    
    var viewModel = DetailedViewModel(activity: ActivityModel())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
        setupBindings()
    }
    
   
    
    func setup() {
        self.detailedImageView.contentMode = .scaleAspectFit
        
        self.detailedLabel.text = viewModel.activityLabel.value
        self.detailedLabel.text = viewModel.activity.value.name
        
        self.detailedImageView.image = viewModel.activity.value.activityImage.image
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.setup()
        })
    }
    
    func setupBindings(){
        
        viewModel.activity.bind({ (activity) in
            DispatchQueue.main.async {
                self.detailedLabel.text = activity.name
                self.detailedImageView.image = activity.activityImage.image
            }

        })
    }

}
