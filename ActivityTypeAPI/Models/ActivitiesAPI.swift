
import Foundation
import UIKit

// MARK: - ActivitiesAPIElement
@objcMembers class ActivitiesAPIElement: NSObject, Decodable {
    let name: String
    let activities: [Activity]
    let id: String

    init(name: String, activities: [Activity], id: String) {
        self.name = name
        self.activities = activities
        self.id = id
    }
}

// MARK: - Activity
@objcMembers class Activity: NSObject, Decodable {
    let name: String
    let activityImage: ActivityImage
    let id: String

    init(name: String, activityImage: ActivityImage, id: String) {
        self.name = name
        self.activityImage = activityImage
        self.id = id
    }
}

// MARK: - ActivityImage
@objcMembers class ActivityImage: NSObject, Decodable {
    let url: String
    let id: String

    init(url: String, id: String) {
        self.url = url
        self.id = id
    }
}

class ActivityModel : NSObject {
    var name: String
    var activityImage: UIImageView
    
    override init() {
        self.name = ""
        self.activityImage = UIImageView()
    }
    
     init(name: String, activityImage: UIImageView) {
        // super.init()
        self.name = name
        self.activityImage = activityImage
    }
}
