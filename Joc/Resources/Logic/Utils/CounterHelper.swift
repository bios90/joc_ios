import Foundation
import UIKit

class CounterHelper
{
    var dialog:LaProductDialog?
   
    init(dialog:LaProductDialog)
    {
        self.dialog = dialog
    }
    
    func recount()
    {
        if(dialog?.product?.type == 2)
        {
            dialog!.lbl_sum!.text = "\(Int(dialog!.product!.price)) р"
            return
        }
        dialog!.lbl_sum!.text = getSumAsString()
    }
    
    func getCurrentSum() ->Double
    {
        if(dialog!.product?.type == 2)
        {
            return dialog!.product!.price
        }
        
        var sum : Double = 0
        sum = sum+getCurrentWeight()!.price
        
        if(getCurrentMilk() != nil)
        {
            sum = sum+getCurrentMilk()!.price
        }
        
        if(getCurrentAdds().count > 0)
        {
            for add in getCurrentAdds()
            {
                sum = sum+add.price
            }
        }
        return sum
    }
    
    func getCurrentSugar()->Int?
    {
        if(dialog!.product!.type == 2)
        {
            return nil
        }
        var selected_sugar = 0
        for i in 0..<dialog!.stack_sugar!.subviews.count
        {
            let toggle = dialog!.stack_sugar!.subviews[i] as! BtnRoundedToggle
            
            if(toggle.isOn)
            {
                selected_sugar = i
            }
        }
        return selected_sugar
    }
    
    func getSumAsString()->String
    {
        let sum = Int(getCurrentSum())
        return "\(sum) р"
    }
    
    func getCurrentWeight()->Model_Weight?
    {
        if(dialog!.product!.type == 2)
        {
            return nil
        }
        
        for i in 0..<dialog!.stack_weights!.subviews.count
        {
            let toggle = dialog!.stack_weights!.subviews[i] as! BtnRoundedToggle
            
            if(toggle.isOn)
            {
                return dialog!.product!.weights[i]
            }
        }
        return nil
    }
    
    func getCurrentMilk()->Model_Milk?
    {
        if(dialog!.product?.milks.count == 0)
        {
            return nil
        }
        
        for i in 0..<dialog!.stack_milk!.subviews.count
        {
            let toggle = dialog!.stack_milk!.subviews[i] as! BtnRoundedToggle
            
            if(toggle.isOn)
            {
                return dialog!.product!.milks[i]
            }
        }
        return nil
    }
    
    func getCurrentAdds()->[Model_Add]
    {
        var selected_adds:[Model_Add] = []
        if(dialog!.product?.adds.count == 0)
        {
            return selected_adds
        }
        for i in 0..<dialog!.stack_adds!.subviews.count
        {
            let toggle = dialog!.stack_adds!.subviews[i] as! BtnRoundedToggle
            
            if(toggle.isOn)
            {
                let add = dialog!.product!.adds[i]
                selected_adds.append(add)
            }
        }
        
        return selected_adds
    }
}
