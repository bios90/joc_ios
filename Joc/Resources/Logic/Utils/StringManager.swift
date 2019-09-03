import Foundation

class StringManager
{
    static func listOfStringToSingle(strings:[String],separator:String)->String
    {
        var message : String = ""
        
        for i in 0..<strings.count
        {
            message += strings[i]
            if(i != (strings.count-1))
            {
                message += separator
            }
        }
        
        return message
    }
}
