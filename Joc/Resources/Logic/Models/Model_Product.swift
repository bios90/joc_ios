import Foundation
import Realm
import RealmSwift

class Model_Product : Object
{
    @objc dynamic var id:Int = 0
    @objc dynamic var cafe_id:Int = 0
    @objc dynamic var type:Int=0
    @objc dynamic var name:String?
    @objc dynamic var desc:String?
    @objc dynamic var img_name:String?
    @objc dynamic var price:Double = 999
    
    var weights = List<Model_Weight>()
    var adds = List<Model_Add>()
    var milks = List<Model_Milk>()
}
