import Foundation
import UIKit

class Fonts : NSObject
{
    static let getInstance = Fonts()
    
    let size_tiny : CGFloat = 10
    let size_xxxs : CGFloat = 12
    let size_xxs : CGFloat = 14
    let size_xs : CGFloat = 16
    let size_s : CGFloat = 18
    let size_m : CGFloat = 21
    let size_l : CGFloat = 24
    let size_xl : CGFloat = 27
    let size_xxl : CGFloat = 30
    
    var font_reg_tiny:UIFont?
    var font_reg_xxxs:UIFont?
    var font_reg_xxs:UIFont?
    var font_reg_xs:UIFont?
    var font_reg_s:UIFont?
    var font_reg_m:UIFont?
    var font_reg_l:UIFont?
    var font_reg_xl:UIFont?
    var font_reg_xxl:UIFont?
    
    let font_semi_tiny:UIFont?
    let font_semi_xxxs:UIFont?
    let font_semi_xxs:UIFont?
    let font_semi_xs :UIFont?
    let font_semi_s  :UIFont?
    let font_semi_m  :UIFont?
    let font_semi_l  :UIFont?
    let font_semi_xl :UIFont?
    let font_semi_xxl:UIFont?
    
    let font_bold_tiny:UIFont?
    let font_bold_xxxs:UIFont?
    let font_bold_xxs:UIFont?
    let font_bold_xs :UIFont?
    let font_bold_s  :UIFont?
    let font_bold_m  :UIFont?
    let font_bold_l  :UIFont?
    let font_bold_xl :UIFont?
    let font_bold_xxl:UIFont?
    
    let font_faw_xxs : UIFont?
    let font_faw_xs :UIFont?
    let font_faw_s  :UIFont?
    let font_faw_m  :UIFont?
    let font_faw_l  :UIFont?
    let font_faw_xl :UIFont?
    let font_faw_xxl:UIFont?
    
    let font_faw_light_xxs : UIFont?
    let font_faw_light_xs :UIFont?
    let font_faw_light_s  :UIFont?
    let font_faw_light_m  :UIFont?
    let font_faw_light_l  :UIFont?
    let font_faw_light_xl :UIFont?
    let font_faw_light_xxl:UIFont?
    
    private let font_reg_name = "Montserrat-Regular"
    private let font_medium_name = "Montserrat-Medium"
    private let font_semi_name = "Montserrat-SemiBold"
    private let font_bold_name = "Montserrat-Bold"
    
    private let font_faw_name = "FontAwesome5Pro-Solid"
    private let font_faw_regular_name = "FontAwesome5Pro-Regular"
    
    override init()
    {
        font_reg_tiny = UIFont(name:font_reg_name,size:size_tiny)
        font_reg_xxxs = UIFont(name:font_reg_name,size:size_xxxs)
        font_reg_xxs = UIFont(name:font_reg_name,size:size_xxs)
        font_reg_xs  = UIFont(name:font_reg_name,size:size_xs )
        font_reg_s  = UIFont(name:font_reg_name,size:size_s )
        font_reg_m  = UIFont(name:font_reg_name,size:size_m )
        font_reg_l  = UIFont(name:font_reg_name,size:size_l )
        font_reg_xl  = UIFont(name:font_reg_name,size:size_xl )
        font_reg_xxl = UIFont(name:font_reg_name,size:size_xxl)
        
        font_semi_tiny = UIFont(name:font_semi_name,size:size_tiny)
        font_semi_xxxs = UIFont(name:font_semi_name,size:size_xxxs)
        font_semi_xxs = UIFont(name:font_semi_name,size:size_xxs)
        font_semi_xs = UIFont(name:font_semi_name,size:size_xs )
        font_semi_s  = UIFont(name:font_semi_name,size:size_s  )
        font_semi_m  = UIFont(name:font_semi_name,size:size_m  )
        font_semi_l  = UIFont(name:font_semi_name,size:size_l  )
        font_semi_xl = UIFont(name:font_semi_name,size:size_xl )
        font_semi_xxl = UIFont(name:font_semi_name,size:size_xxl)
        
        font_bold_tiny = UIFont(name:font_bold_name,size:size_tiny)
        font_bold_xxxs = UIFont(name:font_bold_name,size:size_xxxs)
        font_bold_xxs = UIFont(name:font_bold_name,size:size_xxs)
        font_bold_xs = UIFont(name:font_bold_name,size:size_xs )
        font_bold_s  = UIFont(name:font_bold_name,size:size_s  )
        font_bold_m  = UIFont(name:font_bold_name,size:size_m  )
        font_bold_l  = UIFont(name:font_bold_name,size:size_l  )
        font_bold_xl = UIFont(name:font_bold_name,size:size_xl )
        font_bold_xxl = UIFont(name:font_bold_name,size:size_xxl)
        
        font_faw_xxs = UIFont(name:font_faw_name,size:size_xxs)
        font_faw_xs = UIFont(name:font_faw_name,size:size_xs )
        font_faw_s = UIFont(name:font_faw_name,size:size_s  )
        font_faw_m = UIFont(name:font_faw_name,size:size_m  )
        font_faw_l = UIFont(name:font_faw_name,size:size_l  )
        font_faw_xl = UIFont(name:font_faw_name,size:size_xl )
        font_faw_xxl = UIFont(name:font_faw_name,size:size_xxl)
        
        
        font_faw_light_xxs = UIFont(name:font_faw_regular_name,size:size_xxs)
        font_faw_light_xs = UIFont(name:font_faw_regular_name,size:size_xs)
        font_faw_light_s = UIFont(name:font_faw_regular_name,size:size_s)
        font_faw_light_m = UIFont(name:font_faw_regular_name,size:size_m)
        font_faw_light_l = UIFont(name:font_faw_regular_name,size:size_l)
        font_faw_light_xl = UIFont(name:font_faw_regular_name,size:size_xl)
        font_faw_light_xxl = UIFont(name:font_faw_regular_name,size:size_xxl)
        
    }
}
