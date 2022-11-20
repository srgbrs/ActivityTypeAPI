
import Foundation
import UIKit

class DetailedViewModel : NSObject {

    var activityLabel = Dynamic("")
    var activityImage : Dynamic<UIImage> = Dynamic(UIImage())
    
    var activity : Dynamic<ActivityModel> = Dynamic(ActivityModel())
    
    init(activity: ActivityModel) {
        self.activity.value = activity
   
    }

}
