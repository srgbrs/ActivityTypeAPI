import Foundation


// (Facade pattern)
class NetworkServices {
   lazy var networkQuery =  NetworkQuery()
   
}

class NetworkQuery {
   
   init() {
      
   }

    public func decodeAPI(completionHandler : @escaping (_ allData: [ActivitiesAPIElement]) -> ()){
       guard let url = URL(string: "http://safereturnbackend-dev.eu-west-2.elasticbeanstalk.com/ActivityType/GetAll") else{return}

       let task = URLSession.shared.dataTask(with: url){
           data, response, error in
           
           let decoder = JSONDecoder()
 
           if let data = data{
               do{
                   let tasks = try decoder.decode([ActivitiesAPIElement].self, from: data)
                   completionHandler(tasks)
                   
               }catch{
                   print(error)
               }
           }
       }
       task.resume()

   }
}
