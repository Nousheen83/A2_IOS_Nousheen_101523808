import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        insertDummyData()
        return true
    }
    // MARK: - Dummy Data (10 Products)
    func insertDummyData() {
        
        let context = CoreDataManager.shared.context
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        
        let count = try! context.count(for: request)
        
        if count == 0 {
            for i in 1...10 {
                let p = Product(context: context)
                p.productID = Int64(i)
                p.name = "Product \(i)"
                p.desc = "This is product number \(i)"
                p.price = Double(i * 15)
                p.provider = "Provider \(i)"
            }
            try? context.save()
        }
    }
}