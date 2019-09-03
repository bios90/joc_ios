import Foundation
import RealmSwift

class RealmHelper:LocalDatabase
{
    let db_name_registration = "registration.realm"
    let db_name_login = "login.realm"
    let db_name_main_db = "main.realm"
    
    func save_login_user(user: Model_User)
    {
        let realm = get_login_db()
        
        delete_login_user()
        
        let next_id = get_next_id_for_user(user: user, db_name: db_name_login)
        user.id = next_id
        try! realm.write {
            realm.add(user)
        }
    }
    
    func save_registration_user(user: Model_User)
    {
        let realm = get_registration_db()
        
        let next_id = get_next_id_for_user(user: user, db_name: db_name_registration)
        user.id = next_id
        
        try! realm.write {
            realm.add(user)
        }
    }
    
    func make_fake_login(phone: String, password: String) -> Model_User?
    {
        let realm = get_registration_db()
        
        let users = realm.objects(Model_User.self).filter("phone == %@ AND password == %@",phone,password)
        
        if(users.count == 0)
        {
            return nil
        }
        
        return users.first
    }
    
    func delete_login_user()
    {
        let realm = get_login_db()
        let result = realm.objects(Model_User.self)
        realm.delete(result)
    }
    
    func check_if_phone_used(phone: String) -> Bool
    {
        let realm = get_registration_db()
        
        let users = realm.objects(Model_User.self).filter("phone == %@",phone)
        
        return users.count > 0
    }
    
    
    func get_login_db()->Realm
    {
        var config = Realm.Configuration()
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent(db_name_login)
        let realm = try! Realm(configuration: config)
        return realm
    }
    
    func get_registration_db()->Realm
    {
        var config = Realm.Configuration()
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent(db_name_registration)
        let realm = try! Realm(configuration: config)
        return realm
    }
    
    func get_next_id_for_user(user:Model_User,db_name:String)->Int
    {
        let realm = try! Realm()
        
        if let retNext = realm.objects(type(of: user)).sorted(byKeyPath: "id").first?.id {
            return retNext + 1
        }else{
            return 1
        }
    }
}
