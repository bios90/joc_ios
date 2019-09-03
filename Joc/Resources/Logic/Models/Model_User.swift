import Foundation
import Realm
import RealmSwift

class Model_User : Object
{
    @objc dynamic var id:Int = 0
    @objc dynamic var first_name:String?
    @objc dynamic var last_name:String?
    @objc dynamic var phone:String?
    @objc dynamic var password:String?
}


