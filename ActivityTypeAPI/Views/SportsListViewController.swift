import UIKit

class SportsListViewController: UIViewController {

    @IBOutlet weak var activitiesListTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel = SportsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupBindings()
    
        
    }
    
    func setupBindings() {
        viewModel.activitiesAPIData.bind({ (_) in
            DispatchQueue.main.async {
                self.activitiesListTableView.reloadData()
            }

        })
    }
    
    func setup() {
        activitiesListTableView.delegate = self
        activitiesListTableView.dataSource = self
        
        activitiesListTableView.rowHeight = 70
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.activitiesListTableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailedVC" {
           
                let controller = segue.destination as! DetailedViewController
            controller.viewModel.activity.value = self.viewModel.modelToPass
            
        }
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SportsListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !viewModel.activitiesAPIData.value.isEmpty {
            let section = self.viewModel.activitiesAPIData.value[section]
            return section.activities.count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if !viewModel.activitiesAPIData.value.isEmpty {
            return viewModel.activitiesAPIFilteredData.value.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.activitiesAPIFilteredData.value[section].name
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell") as! ActivityTableViewCell
        
        let sectionIndex = indexPath.section
        let rowIndex = indexPath.row
        
        cell.activityLabel.text = self.viewModel.activitiesAPIFilteredData.value[sectionIndex].activities[rowIndex].name
        
        let imageURL = self.viewModel.activitiesAPIFilteredData.value[sectionIndex].activities[rowIndex].activityImage.url

        
        cell.activityImage.download(from: imageURL)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = viewModel.activitiesAPIFilteredData.value[indexPath.section].activities[indexPath.row].name
        
        let imageURL = viewModel.activitiesAPIFilteredData.value[indexPath.section].activities[indexPath.row].activityImage.url
        
        
        
        let activityModel = ActivityModel()
        
        activityModel.name = name
        activityModel.activityImage.download(from: imageURL)
        
        // self.segueToDetail(viewModel: activityModel)
        
        viewModel.modelToPass = activityModel
        
        performSegue(withIdentifier: "toDetailedVC", sender: self)
    }
    
    
}

// MARK: - UISearchBarDelegate
extension SportsListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        // let filteredData = self.viewModel.activitiesAPIFilteredData.value[0].activities.map{ $0.name }
        let data = self.viewModel.activitiesAPIData.value
        
//        viewModel.activitiesAPIFilteredData.value = searchText.isEmpty ? data : data[0].activities.filter ({ $0.name.range(of: searchText, options: .caseInsensitive) != nil})

        self.activitiesListTableView.reloadData()
        
    }
    
}
