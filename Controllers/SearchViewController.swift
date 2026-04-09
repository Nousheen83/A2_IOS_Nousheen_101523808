import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    var results: [Product] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@ OR desc CONTAINS[cd] %@", searchText, searchText)
        
        results = try! CoreDataManager.shared.context.fetch(request)
        tableView.reloadData()
    }
}