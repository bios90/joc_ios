import Foundation
import Cosmos

class RatingView : CosmosView
{
    let width:Double
    let distance:Double
    
    init(rating:Double,can_touch:Bool,width:Double,distance:Double,white:Bool = false)
    {
        self.width = width
        self.distance = distance
        
        var filled_name = "star_filled"
        var empty_name = "star_empty"
        
        if(white)
        {
            filled_name = "star_white"
            empty_name = "star_trans"
        }
        
        var settings = CosmosSettings()
        settings.updateOnTouch = can_touch
        settings.fillMode = .precise
        settings.starSize = width
        settings.starMargin = distance
        settings.filledImage = UIImage(named: filled_name)
        settings.emptyImage = UIImage(named: empty_name)
        
        super.init(frame: CGRect.zero,settings: settings)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rating = rating
    }

    func get_sized_width()->Double
    {
        return (width*5)+(distance*4)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        width = 15
        distance = 1
        super.init(coder: aDecoder)
    }
}

