import Foundation
import Realm
import RealmSwift

class Model_Order : Object
{
    @objc dynamic var id:Int = 0
    @objc dynamic var restaraunt_id:Int = 0
    @objc dynamic var date:Date?
    @objc dynamic var sum:Double = 999999
    @objc dynamic var items:String?
    @objc dynamic var status:Int = 999
    @objc dynamic var restaraunt:Model_Restaraunt?
}
