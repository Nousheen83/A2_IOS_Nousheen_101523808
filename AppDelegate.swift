func insertDummyData() {
    let context = CoreDataManager.shared.context
    
    let request: NSFetchRequest<Product> = Product.fetchRequest()
    let count = try! context.count(for: request)
    
    if count == 0 {
        for i in 1...10 {
            let p = Product(context: context)
            p.productID = Int64(i)
            p.name = "Product \(i)"
            p.desc = "Description for product \(i)"
            p.price = Double(i * 10)
            p.provider = "Provider \(i)"
        }
        try? context.save()
    }
}