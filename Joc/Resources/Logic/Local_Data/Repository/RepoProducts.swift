import Foundation
import RealmSwift

class RepoProducts
{
    static func descriptions()->[String]
    {
        return
            [
                "eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis a cras semper auctor neque vitae tempus quam pellentesque",
                "nam aliquam sem et tortor consequat id porta nibh venenatis cras sed felis eget",
                "ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis",
                "a pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius quam quisque id diam vel quam elementum pulvinar etiam",
                "ultrices eros in cursus turpis massa tincidunt dui ut ornare lectus sit amet est placerat in egestas erat imperdiet sed euismod nisi",
                "aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam",
                "leo duis ut diam quam nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus risus at",
                "malesuada fames ac turpis egestas sed tempus urna et pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna eget est lorem ipsum dolor sit"
        ]
    }
    
    static func getRandomProductsNames()->String
    {
        let products = getProducts()
        
        let randomInt = Int.random(in: 1..<5)
        var names:[String] = []
        
        for _ in 0...randomInt
        {
            names.append(products.randomElement()!.name!)
        }
        
        return StringManager.listOfStringToSingle(strings: names, separator: ", ")
    }
    
    static func getTripleWeights()->List<Model_Weight>
    {
        let weight1 = Model_Weight()
        weight1.weight = 200
        weight1.price = 200
        
        let weight2 = Model_Weight()
        weight2.weight = 300
        weight2.price = 220
        
        let weight3 = Model_Weight()
        weight3.weight = 400
        weight3.price = 260
        
        var list : List<Model_Weight> = List()
        list.append(weight1)
        list.append(weight2)
        list.append(weight3)
        
        return list
    }
    
    
    static func getSingleWeights()->Model_Weight
    {
        let weights:[Double] = [100,180,200,250,300,400,500]
        let prices:[Double] = [100,150,180,200,240,250,300]
    
        let weight = Model_Weight()
        weight.weight = weights.randomElement() ?? 300
        weight.price = prices.randomElement() ?? 200
        
        return weight
    }
    
    static func getRandomAdd()->Model_Add
    {
        let names = ["Карамель","Ваниль","Шоколад","Корица","Сливки","Мороженое","Сироп"]
        let prices:[Double] = [20,25,30,35,40,45,50,60,80]
        
        let add = Model_Add()
        add.name = names.randomElement()
        add.price = prices.randomElement() ?? 30
        
        return add
    }
    
    static func getRandomMilk()->Model_Milk
    {
        let names = ["Обычное","Кокосовое","Соевое","Птичье","Тростниковое"]
        let prices:[Double] = [20,25,30,35,40,45,50,60,80]
        
        let milk = Model_Milk()
        milk.name = names.randomElement()
        milk.price = prices.randomElement() ?? 30
        
        return milk
    }
    
    static func getTripleAdds() -> List<Model_Add>
    {
        var list : List<Model_Add> = List()
        list.append(getRandomAdd())
        list.append(getRandomAdd())
        list.append(getRandomAdd())
        
        return list
    }
    
    static func getTripleMilks() -> List<Model_Milk>
    {
        var list : List<Model_Milk> = List()
        list.append(getRandomMilk())
        list.append(getRandomMilk())
        list.append(getRandomMilk())
        
        return list
    }
    
    
    
    static func getProducts()->[Model_Product]
    {
        let cappucino = Model_Product()
        cappucino.id = 1
        cappucino.type = 0
        cappucino.name = "Каппучино"
        cappucino.desc = descriptions().randomElement()
        cappucino.img_name = "cappu"
        
        cappucino.weights = getTripleWeights()
        cappucino.adds = getTripleAdds()
        cappucino.milks = getTripleMilks()
        
        
        
        let americano = Model_Product()
        americano.id = 2
        americano.type = 0
        americano.name = "Американо"
        americano.desc = descriptions().randomElement()
        americano.img_name = "americano"
        
        americano.weights = getTripleWeights()
        americano.adds = getTripleAdds()
        americano.milks = getTripleMilks()

        
        
        let espresso = Model_Product()
        espresso.id = 3
        espresso.type = 0
        espresso.name = "Еспрессо"
        espresso.desc = descriptions().randomElement()
        espresso.img_name = "espresso"
        
        espresso.weights = getTripleWeights()
        espresso.adds = getTripleAdds()
        espresso.milks = getTripleMilks()
        
        
        
        let latte = Model_Product()
        latte.id = 4
        latte.type = 0
        latte.name = "Латте"
        latte.desc = descriptions().randomElement()
        latte.img_name = "latte"
        
        latte.weights = getTripleWeights()
        latte.adds = getTripleAdds()
        latte.milks = getTripleMilks()
        
        
        let mokka = Model_Product()
        mokka.id = 5
        mokka.type = 0
        mokka.name = "Мокка"
        mokka.desc = descriptions().randomElement()
        mokka.img_name = "mokka"
        
        mokka.weights = getTripleWeights()
        mokka.adds = getTripleAdds()
        mokka.milks = getTripleMilks()
        
        
        
        let frappe = Model_Product()
        frappe.id = 6
        frappe.type = 1
        frappe.name = "Фраппе"
        frappe.desc = descriptions().randomElement()
        frappe.img_name = "frappe"
        frappe.weights.append(getSingleWeights())
        
        
        
        let ice_latte = Model_Product()
        ice_latte.id = 7
        ice_latte.type = 1
        ice_latte.name = "Айс Латте"
        ice_latte.desc = descriptions().randomElement()
        ice_latte.img_name = "ice_latte"
        ice_latte.weights.append(getSingleWeights())
        
        
        
        let smuzi = Model_Product()
        smuzi.id = 8
        smuzi.type = 1
        smuzi.name = "Смузи"
        smuzi.desc = descriptions().randomElement()
        smuzi.img_name = "smuzi"
        smuzi.weights.append(getSingleWeights())
        
        
        let cesar = Model_Product()
        cesar.id = 9
        cesar.type = 2
        cesar.name = "Салат Цезарь"
        cesar.desc = descriptions().randomElement()
        cesar.img_name = "cesar"
        cesar.price = Double.random(in: 100..<456)
        
        let roll = Model_Product()
        roll.id = 10
        roll.type = 2
        roll.name = "Ролл сэндвич"
        roll.desc = descriptions().randomElement()
        roll.img_name = "roll"
        roll.price = Double.random(in: 100..<456)
        
        
        let sirnik = Model_Product()
        sirnik.id = 11
        sirnik.type = 2
        sirnik.name = "Сырник"
        sirnik.desc = descriptions().randomElement()
        sirnik.img_name = "sirnik"
        sirnik.price = Double.random(in: 100..<456)
        
        
        return [cappucino,americano,espresso,latte,mokka,frappe,ice_latte,smuzi,cesar,roll,sirnik]
    }
    

}
