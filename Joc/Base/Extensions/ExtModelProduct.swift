import UIKit

extension Model_Product
{
    func get_price_text_min()->String
    {
        if(self.type == 0 || self.type == 1)
        {
            return "от \(Int(self.weights[0].price))р"
        }
        
        return "\(Int(self.price))р"
    }
}
