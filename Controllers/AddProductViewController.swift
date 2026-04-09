import UIKit

class AddProductViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var providerField: UITextField!
    
    @IBAction func saveProduct(_ sender: UIButton) {
        
        let context = CoreDataManager.shared.context
        let product = Product(context: context)
        
        product.productID = Int64(Date().timeIntervalSince1970)
        product.name = nameField.text
        product.desc = descField.text
        product.price = Double(priceField.text ?? "") ?? 0
        product.provider = providerField.text
        
        CoreDataManager.shared.saveContext()
        navigationController?.popViewController(animated: true)
    }
}