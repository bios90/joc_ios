import Foundation

class RepoOrders
{
    static func get_orders()->[Model_Order]
    {
        var orders:[Model_Order] = []
        
        let randomInt = Int.random(in: 1..<10)
        let restaraunts = RepoRestaraunts.getRestaraunts()
        
        for _ in 0...randomInt
        {
            let order = Model_Order()
            let restaraunt = restaraunts.randomElement()
            let price = Int.random(in: 112..<928)
            let status = Int.random(in: 0..<2)
            
            order.restaraunt = restaraunt
            order.date = DateManager.getRandomDateForOrder(daysBack: 5)
            order.sum = Double(price)
            order.status = status
            order.items = RepoProducts.getRandomProductsNames()
            
            orders.append(order)
        }
        
        return orders
    }
}
