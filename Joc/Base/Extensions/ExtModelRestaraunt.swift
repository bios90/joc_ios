import Foundation

extension Model_Restaraunt
{
    func get_work_hours_string()->String
    {
        let time_ot = self.time_ot!.fotmatToString(format: DateManager.FORMAT_TIME)
        let time_do = self.time_do!.fotmatToString(format: DateManager.FORMAT_TIME)
        
        return "\(time_ot) - \(time_do)"
    }
}
