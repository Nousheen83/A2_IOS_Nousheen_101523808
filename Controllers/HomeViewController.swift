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
        displayProduct()
    }
    
    func fetchProducts() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        products = try! CoreDataManager.shared.context.fetch(request)
    }
    
    func displayProduct() {
        if products.count > 0 {
            let product = products[index]
            nameLabel.text = product.name
            descLabel.text = product.desc
            priceLabel.text = "$\(product.price)"
            providerLabel.text = product.provider
        }
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if index < products.count - 1 {
            index += 1
            displayProduct()
        }
    }
    
    @IBAction func prevPressed(_ sender: UIButton) {
        if index > 0 {
            index -= 1
            displayProduct()
        }
    }
}