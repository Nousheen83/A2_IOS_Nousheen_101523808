import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    var products: [Product] = []
    var index = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProducts()
        display()
    }
    
    func fetchProducts() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        products = try! CoreDataManager.shared.context.fetch(request)
    }
    
    func display() {
        if products.count > 0 {
            let p = products[index]
            nameLabel.text = p.name
            descLabel.text = p.desc
            priceLabel.text = "Price: \(p.price)"
            providerLabel.text = p.provider
        }
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if index < products.count - 1 {
            index += 1
            display()
        }
    }
    
    @IBAction func prevTapped(_ sender: UIButton) {
        if index > 0 {
            index -= 1
            display()
        }
    }
}