import Foundation
import Realm
import RealmSwift

class Model_Reply : Object
{
    @objc dynamic var id:Int = 0
    @objc dynamic var date:Date?
    @objc dynamic var image_name:String?
    @objc dynamic var rating:Double = 999999
    @objc dynamic var user_name:String?
    @objc dynamic var text:String?
}
