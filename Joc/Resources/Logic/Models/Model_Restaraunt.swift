import Foundation
import Realm
import RealmSwift

class Model_Restaraunt : Object
{
    @objc dynamic var id:Int = 0
    @objc dynamic var name:String?
    @objc dynamic var adress:String?
    @objc dynamic var desc:String?
    @objc dynamic var logo:String?
    @objc dynamic var lat:Double=999
    @objc dynamic var lon:Double=999
    @objc dynamic var time_ot:Date?
    @objc dynamic var time_do:Date?
    @objc dynamic var rating:Double = 999
    
    var products = List<Model_Product>()
}
