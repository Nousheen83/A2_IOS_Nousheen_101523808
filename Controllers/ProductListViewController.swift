import UIKit
import CoreData

class ProductListViewController: UITableViewController {
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    
    func fetch() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        products = try! CoreDataManager.shared.context.fetch(request)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let p = products[indexPath.row]
        cell.textLabel?.text = p.name
        cell.detailTextLabel?.text = p.desc
        
        return cell
    }
}