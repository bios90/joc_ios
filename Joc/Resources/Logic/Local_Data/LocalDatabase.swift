import Foundation

protocol LocalDatabase
{
    func save_login_user(user:Model_User)
    func save_registration_user(user:Model_User)
    func make_fake_login(phone:String,password:String)->Model_User?
    func check_if_phone_used(phone:String)->Bool
    func delete_login_user()
}
