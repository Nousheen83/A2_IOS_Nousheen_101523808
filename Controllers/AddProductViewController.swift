import UIKit

class AddProductViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var providerField: UITextField!

    @IBAction func saveTapped(_ sender: UIButton) {

        let context = CoreDataManager.shared.context
        let p = Product(context: context)

        p.productID = Int64(Date().timeIntervalSince1970)
        p.name = nameField.text
        p.desc = descField.text
        p.price = Double(priceField.text ?? "") ?? 0
        p.provider = providerField.text

        CoreDataManager.shared.save()

        navigationController?.popViewController(animated: true)
    }
}