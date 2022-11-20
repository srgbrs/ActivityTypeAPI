import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var activityImage: UIImageView!
    
    @IBOutlet weak var activityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
