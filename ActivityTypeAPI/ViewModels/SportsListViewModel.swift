import Foundation
import UIKit


class SportsListViewModel : NSObject {
    
    let networkManager = NetworkQuery()
    
    var activitiesAPIData : Dynamic<[ActivitiesAPIElement]> = Dynamic([])
    var activitiesAPIFilteredData : Dynamic<[ActivitiesAPIElement]> = Dynamic([])
    var modelToPass : ActivityModel = ActivityModel()
    
    override init() {
        super.init()
        self.recieveData()
    }
    
    func recieveData() {
        self.networkManager.decodeAPI(completionHandler: { (data) in
            self.activitiesAPIData.value = data
            self.activitiesAPIFilteredData.value = data
        })
    }
    
}
