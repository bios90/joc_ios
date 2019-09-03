import Foundation

class RepoReplies
{
    static func getReplies()->[Model_Reply]
    {
        let reply1 = Model_Reply()
        reply1.id = 1
        reply1.image_name = "mike"
        reply1.date = DateManager.getRandomDateForOrder(daysBack: 5)
        reply1.rating = 4.5
        reply1.user_name = "Mike Penz"
        reply1.text = "A scelerisque purus semper eget duis at tellus at urna condimentum mattis pellentesque id nibh tortor id aliquet lectus proin nibh nisl condimentum"
        
        
        let reply2 = Model_Reply()
        reply2.id = 2
        reply2.image_name = "daniel"
        reply2.date = DateManager.getRandomDateForOrder(daysBack: 5)
        reply2.rating = 4.1
        reply2.user_name = "Daniel Gustavo"
        reply2.text = "Condimentum mattis pellentesque id nibh tortor id aliquet lectus proin nibh nisl condimentum id venenatis a condimentum vitae sapien pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas sed tempus urna et pharetra pharetra massa."
        
        
        let reply3 = Model_Reply()
        reply3.id = 3
        reply3.image_name = "caroline"
        reply3.date = DateManager.getRandomDateForOrder(daysBack: 5)
        reply3.rating = 4.8
        reply3.user_name = "Caroline Jason"
        reply3.text = "Rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin."
        
        
        let reply4 = Model_Reply()
        reply4.id = 4
        reply4.image_name = "steven"
        reply4.date = DateManager.getRandomDateForOrder(daysBack: 5)
        reply4.rating = 4.1
        reply4.user_name = "Steven Clark"
        reply4.text = "Pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi leo urna molestie at elementum eu facilisis sed odio."
        
        
        let reply5 = Model_Reply()
        reply5.id = 5
        reply5.image_name = "elison"
        reply5.date = DateManager.getRandomDateForOrder(daysBack: 5)
        reply5.rating = 1
        reply5.user_name = "Elison Bollsom"
        reply5.text = "Hac habitasse platea dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris a diam maecenas sed enim ut sem viverra aliquet eget sit amet tellus cras adipiscing."
        
        return [reply1,reply2,reply3,reply4,reply5]
    }
}
