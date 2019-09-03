import Foundation
import RealmSwift

class Model_Milk : Object
{
    @objc dynamic var id:Int = 0
    @objc dynamic var item_id:Int = 0
    @objc dynamic var name:String?
    @objc dynamic var price:Double=999
}
