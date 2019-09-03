import Foundation
import UIKit

class EtUnderline: UITextField
{
    func customInit()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = Colors.getInstance.white
        self.textAlignment = .left
        self.sizeToFit()
        self.addLine(position: .LINE_POSITION_BOTTOM, color: Colors.getInstance.white, width: 1)
        
        
        self.returnKeyType = .done
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 8, y: bounds.origin.y, width: bounds.width - 16, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 8, y: bounds.origin.y, width: bounds.width - 16, height: bounds.height)
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        customInit()
    }
}
