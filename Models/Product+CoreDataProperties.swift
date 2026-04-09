import Foundation
import CoreData

extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var productID: Int64
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var price: Double
    @NSManaged public var provider: String?
}