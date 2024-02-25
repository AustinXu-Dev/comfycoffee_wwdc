//
//  Coffee.swift
//  wwdc_comfycoffee
//
//  Created by Austin Xu on 2024/2/9.
//

import Foundation

struct Coffee: Identifiable, Hashable{
    let id: UUID = .init()
    let coffeeImage: String
    let name: String
    
    let duration: Double
    let makingSteps: String
    
}


let coffees: [Coffee] = [
    .init(coffeeImage: "1", name: "Espresso", duration: 0.5, makingSteps: "Grind coffee beans to a fine consitency.\nPack finely ground coffee into an espresso machine's portafilter.\nExtract a shot of espresso (about 25-30ml) under high pressure."),
    .init(coffeeImage: "2", name: "Doppio", duration: 2.5, makingSteps: "Grind coffee beans to a fine consistency.\nPack finely ground coffee into an espresso machine's portafilter.\nExtract two shot of espresso(about 25-30ml each) under high pressure.\n"),
    .init(coffeeImage: "3", name: "Americano", duration: 2, makingSteps: "Brew a shot of espresso.\nAdd hot water to the espresso, typically in a 1:1 ratio"),
    .init(coffeeImage: "4", name: "Cappuccino", duration: 2.5, makingSteps: "Brew a shot of espresso.\nSteam and froth milk using a milk frother or espresso machine.\nPour the steamed milk over the espresso, holding back the foam with a spoon.\nSpoon the milk foam on top of the coffee"),
    .init(coffeeImage: "5", name: "Latte", duration: 3, makingSteps: "Brew a shot of espresso.\nSteam and froth milk.\nPour the steamed milk over the espresso, holding back the foam.\nSpoon a thin layer of milk foam on top."),
    .init(coffeeImage: "6", name: "Mocha", duration: 3, makingSteps: "Brew a shot of espresso.\nHeat and mix chocolate syrup or cocoa powder with the espresso.\nSteam and froth milk.\nPour the steamed milk over the chocolate espresso mixture.\nOptionally, add whipeed cream and chocolate shavings on top."),
    .init(coffeeImage: "7", name: "Macchiato", duration: 3, makingSteps: "Brew a shot of espresso.\nAdd a dollop of foamed milk or a small amount of steamed milk to the espresso."),
    .init(coffeeImage: "8", name: "Irish Coffee", duration: 2, makingSteps: "Brew a strong cup of hot coffee.\nAdd a shot of Irish whiskey and a teaspoon of brown sugar to a glass.\nPour the hot coffee into the glass and stir until the sugar dissolves.\nTop with whipped cream.")
]
