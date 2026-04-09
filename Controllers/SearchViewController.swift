import UIKit
import CoreData

class SearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    var results: [Product] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange text: String) {
        
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.predicate = NSPredicate(format:
            "name CONTAINS[cd] %@ OR desc CONTAINS[cd] %@", text, text)
        
        results = try! CoreDataManager.shared.context.fetch(request)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let p = results[indexPath.row]
        
        cell.textLabel?.text = p.name
        cell.detailTextLabel?.text = p.desc
        
        return cell
    }
}