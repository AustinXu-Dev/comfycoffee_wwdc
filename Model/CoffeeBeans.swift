import SwiftUI

struct CoffeeBeans: Hashable{
    var id = UUID()
    var beanName: String
    var description: String
    var image: String
}


struct CoffeeBeansData{
    let coffeeBeansData = [
        CoffeeBeans(beanName: "Arabica", description: "Arabica beans are prized for their smooth, delicate flavor profile, often featuring notes of fruit and floral tones.", image: "arabica"),
        CoffeeBeans(beanName: "Robusta", description: "Robusta beans are known for their bold, strong flavor with earthy and sometimes nutty undertones.", image: "robusta"),
        CoffeeBeans(beanName: "Ethiopian Yirgacheffe", description: "Ethiopian Yirgacheffe beans are renowned for their distinctively bright acidity and floral, citrusy flavor profile.", image: "ethiopian"),
        CoffeeBeans(beanName: "Colombian Supremo", description: "Colombian Supremo beans are celebrated for their well-balanced flavor profile, featuring medium acidity, a full body, and a rich, nutty sweetness.", image: "colombian"),
        CoffeeBeans(beanName: "Sumatra Mandheling", description: "Sumatra Mandheling beans are prized for their bold, earthy flavor profile with low acidity and a heavy, syrupy body.", image: "sumatra"),
        CoffeeBeans(beanName: "Kenyan AA", description: "Kenyan AA beans are known for their bright acidity, full body, and complex flavor profile. ", image: "kenyan"),
        CoffeeBeans(beanName: "Costa Rican Tarrazú", description: "Costa Rican Tarrazú beans are esteemed for their bright acidity, medium body, and nuanced flavor profile.", image: "costa"),
        CoffeeBeans(beanName: "Guatemalan Antigua", description: "Guatemalan Antigua beans are prized for their rich, chocolatey flavor profile, balanced acidity, and velvety body.", image: "guatamalan"),
        
    ]

}
