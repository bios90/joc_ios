import Foundation

class DateManager
{
    static let FORMAT_YYMMDD_FOR_DISPLAY = "dd MMMM yyyy"
    static let FORMAT_YYMMDD_FOR_BIRTHDAY = "dd MMMM"
    static let FORMAT_AS_LARAVEL = "yyyy-MM-dd HH:mm:ss"
    static let FORMAT_DATE_AND_TIME = "dd MMMM yyyy HH:mm"
    static let FORMAT_TIME = "HH:mm"
    static let FORMAT_DATE_NUMBERS = "dd-MM-yyyy"
    static let FORMAT_FILE_NAME = "dd-MM-yyyy_HH-mm-ss"
    static let FORMAT_DATE_CREATION = "yyyy-MM-dd H:m"
    
    static func getDateFromTime(hours:Int,minutes:Int)->Date
    {
        let formatter = DateFormatter()
        formatter.dateFormat = FORMAT_DATE_CREATION
        let date_str = "2000-06-22 \(hours):\(minutes)"
        let someDateTime = formatter.date(from: date_str)
        return someDateTime!
    }
    
    static func getRandomDateForOrder(daysBack: Int)->Date
    {
        let day = arc4random_uniform(UInt32(daysBack))+1
        let hour = arc4random_uniform(23)
        let minute = arc4random_uniform(59)
        
        let today = Date(timeIntervalSinceNow: 0)
        let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = -1 * Int(day - 1)
        offsetComponents.hour = -1 * Int(hour)
        offsetComponents.minute = -1 * Int(minute)
        
        let randomDate = gregorian?.date(byAdding: offsetComponents, to: today, options: .init(rawValue: 0) )
        return randomDate!
    }
}

extension Date
{
    func fotmatToString()->String
    {
        return fotmatToString(format: DateManager.FORMAT_YYMMDD_FOR_DISPLAY)
    }
    
    func fotmatToString(format:String)->String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = format

        return formatter.string(from: self)
    }
    
    func isSameDateTo(date:Date)->Bool
    {
        let diff = Calendar.current.dateComponents([.day], from: self, to: date)
        if diff.day == 0
        {
            return true
        } else
        {
            return false
        }
    }
}
