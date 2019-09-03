import Foundation

class ValidationManager
{
    static func validate_register(first_name:String?,last_name:String?,phone:String?,password1:String?,password2:String?)->Bool
    {
        if(first_name == nil || first_name!.count == 0)
        {
            return false
        }
        
        if(last_name == nil || last_name!.count == 0)
        {
            return false
        }
        
        if(phone == nil || phone!.count == 0)
        {
            return false
        }
        else if(!(phone!.isPhoneNumber))
        {
            return false
        }
        
        if((password1 == nil || password1!.count == 0) || (password2 == nil || password2!.count == 0))
        {
            return false
        }
        else if(password1!.count < 8)
        {
            return false
        }
        else if(password1 != password2 )
        {
            return false
        }
    
        return true
    }
    
    static func get_register_error(first_name:String?,last_name:String?,phone:String?,password1:String?,password2:String?)->[String]
    {
        var errors:[String]=[]
        
        if(first_name == nil || first_name!.count == 0)
        {
            errors.append("Заполните поле 'Имя'")
        }
        
        if(last_name == nil || last_name!.count == 0)
        {
            errors.append("Заполните поле 'Фамилия'")
        }
        
        if(phone == nil || phone!.count == 0)
        {
            errors.append("Заполните поле 'Телефон'")
        }
        else if(!(phone!.isPhoneNumber))
        {
            errors.append("Введите корректный номер телефона")
        }
        
        if((password1 == nil || password1!.count == 0) || (password2 == nil || password2!.count == 0))
        {
            errors.append("Заполните поля 'Пароль' и 'Повторите пароль'")
        }
        else if(password1!.count < 8)
        {
            errors.append("Пароль должен содержать минимум 8 символов")
        }
        else if(password1 != password2 )
        {
            errors.append("Пароли не овпадают")
        }
        
        return errors
    }
}
