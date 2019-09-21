import Foundation

struct Model_Added_Item
{
    var product:Model_Product?
    var selected_weight:Model_Weight?
    var selected_milk:Model_Milk?
    var selected_adds:[Model_Add]?
    var selected_sugar:Int?
    var sum:Double?
}

extension Model_Added_Item
{
    func getSumText()->String
    {
        let _sum = Int(sum!)
        return "\(_sum) р"
    }
    
    func getWeightText() -> String
    {
        return "\(Int(selected_weight!.weight)) мл"
    }
    
    func getSugarText() -> String
    {
        if(selected_sugar == 0)
        {
            return "Без сахара"
        }
        
        return "\(selected_sugar!)"
    }
    
    func getMilkText() -> String
    {
        if(selected_milk == nil)
        {
            return " - "
        }
        
        return "\(selected_milk!.name!)"
    }
}
