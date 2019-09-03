import Foundation

class RepoRestaraunts
{
    static func getRestaraunts() -> [Model_Restaraunt]
    {
        let stump = Model_Restaraunt()
        stump.id = 1
        stump.name = "Stumptown Coffee"
        stump.adress = "улица Арбат, 23с1"
        stump.logo = "stump"
        stump.lat = 55.749653
        stump.lon = 37.594834
        stump.time_ot = DateManager.getDateFromTime(hours: 9, minutes: 30)
        stump.time_do = DateManager.getDateFromTime(hours: 21, minutes: 0)
        stump.rating = 4.8
        stump.desc = RepoProducts.descriptions().randomElement()
        
        
        let starbucks = Model_Restaraunt()
        starbucks.id = 2
        starbucks.name = "Sturbacks"
        starbucks.adress = "улица Арбат, 24"
        starbucks.logo = "starbucks"
        starbucks.lat = 55.749918
        starbucks.lon = 37.592352
        starbucks.time_ot = DateManager.getDateFromTime(hours: 9, minutes: 0)
        starbucks.time_do = DateManager.getDateFromTime(hours: 0, minutes: 0)
        starbucks.rating = 4.4
        starbucks.desc = RepoProducts.descriptions().randomElement()
        
        
        let cofemania = Model_Restaraunt()
        cofemania.id = 3
        cofemania.name = "Кофе Мания"
        cofemania.adress = "улица Арбат, 18/1с2"
        cofemania.logo = "cofemania"
        cofemania.lat = 55.751047
        cofemania.lon = 37.593559
        cofemania.time_ot = DateManager.getDateFromTime(hours: 10, minutes: 0)
        cofemania.time_do = DateManager.getDateFromTime(hours: 22, minutes: 0)
        cofemania.rating = 4.7
        cofemania.desc = RepoProducts.descriptions().randomElement()
        
        
        let jeffreys = Model_Restaraunt()
        jeffreys.id = 4
        jeffreys.name = "Jeffrey's"
        jeffreys.adress = "улица Арбат, 17"
        jeffreys.logo = "jeffreys"
        jeffreys.lat = 55.751001
        jeffreys.lon = 37.596491
        jeffreys.time_ot = DateManager.getDateFromTime(hours: 10, minutes: 0)
        jeffreys.time_do = DateManager.getDateFromTime(hours: 0, minutes: 0)
        jeffreys.rating = 4.7
        jeffreys.desc = RepoProducts.descriptions().randomElement()
        
        
        let costa = Model_Restaraunt()
        costa.id = 5
        costa.name = "Costa Coffee"
        costa.adress = "улица Арбат, 34"
        costa.logo = "costa"
        costa.lat = 55.749199
        costa.lon = 37.594008
        costa.time_ot = DateManager.getDateFromTime(hours: 8, minutes: 0)
        costa.time_do = DateManager.getDateFromTime(hours: 22, minutes: 0)
        costa.rating = 4.2
        costa.desc = RepoProducts.descriptions().randomElement()
        
        var restaraunts = [stump,starbucks,cofemania,jeffreys,costa]
        
        for rest in restaraunts
        {
            rest.products.append(objectsIn: RepoProducts.getProducts())
        }
        
        return restaraunts
    }
}
