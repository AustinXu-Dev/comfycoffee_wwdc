//
//  TrackerView.swift
//  wwdc_comfycoffee
//
//  Created by Austin Xu on 2024/2/23.
//

import SwiftUI

struct TrackerView: View {
    
//    @State var waterProgress: Double = 0.0
//    @State var teaProgress: Double = 0.0
//    @State var coffeeProgress: Double = 0.0
//    @State var juiceProgress: Double = 0.0
//    @State var otherProgress: Double = 0.0
    
    @State var waterProgress: Double
    @State var teaProgress: Double
    @State var coffeeProgress: Double
    @State var juiceProgress: Double
    @State var otherProgress: Double
    
    @State var waterText: String = "Water"
    @State var teaText: String = "Tea"
    @State var coffeeText: String = "Coffee"
    @State var juiceText: String = "Juice"
    @State var otherText: String = "Other"
    
    @State var waterColor: Color = Color.blue
    @State var teaColor: Color = Color("teacolor")
    @State var coffeeColor: Color = Color("coffeecolor")
    @State var juiceColor: Color = Color.orange
    @State var otherColor: Color = Color.cyan
    
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 60) {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 150, maximum: 150))], spacing: 30) {
                    HStack(spacing: 50){
                        CircleProgressView(text: $waterText, progress: $waterProgress, color: $waterColor).frame(width: 150, height: 150)
                        CircleProgressView(text: $teaText, progress: $teaProgress, color: $teaColor)
                            .frame(width: 150, height: 150)
                        CircleProgressView(text: $coffeeText, progress: $coffeeProgress, color: $coffeeColor)
                            .frame(width: 150, height: 150)
                    }
                    HStack(spacing: 50){
                        CircleProgressView(text: $juiceText, progress: $juiceProgress, color: $juiceColor)
                            .frame(width: 150, height: 150)
                        CircleProgressView(text: $otherText, progress: $otherProgress, color: $otherColor)
                            .frame(width: 150, height: 150)
                    }
                }

                HStack(alignment: .center, spacing: 30){
                    Button(action: {
                        if waterProgress < 1{
                            waterProgress = (waterProgress * 10.0 + 1.0).rounded() / 10.0
                        } else{
                            waterProgress = 1
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .shadow(color: .blue, radius: 5, x: 1, y: 1)
                            .frame(width: 110, height: 160)
                            .foregroundStyle(.white)
    //                        .shadow(color: .gray, radius: 5, x: 1, y: 1)
                            .overlay {
                                VStack{
                                    Image("watercup")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60)
                                    Text("Water")
                                }
                            }
                    }).foregroundStyle(.black)
                    
                    Button(action: {
                        if teaProgress < 1{
                            teaProgress = (teaProgress * 10.0 + 1.0).rounded() / 10.0
                        } else{
                            teaProgress = 1
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .shadow(color: Color("teacolor"), radius: 5, x: 1, y: 1)
                            .frame(width: 110, height: 160)
                            .foregroundStyle(.white)
                            .overlay {
                                VStack{
                                    Image("teacup")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60)
                                    Text("Tea")
                                }
                            }
                    }).foregroundStyle(.black)
                    
                    Button(action: {
                        if coffeeProgress < 1{
                            coffeeProgress = (coffeeProgress * 10.0 + 1.0).rounded() / 10.0
                        } else{
                            coffeeProgress = 1
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .shadow(color: Color("coffeecolor"), radius: 5, x: 1, y: 1)
                            .frame(width: 110, height: 160)
                            .foregroundStyle(.white)
                            .overlay {
                                VStack{
                                    Image("coffeecup")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60)
                                    Text("Coffee")
                                }
                            }
                    }).foregroundStyle(.black)
                    
                    Button(action: {
                        if juiceProgress < 1{
                            juiceProgress = (juiceProgress * 10.0 + 1.0).rounded() / 10.0
                        } else{
                            juiceProgress = 1
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .shadow(color: .orange, radius: 5, x: 1, y: 1)
                            .frame(width: 110, height: 160)
                            .foregroundStyle(.white)
                            .overlay {
                                VStack{
                                    Image("juice")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60)
                                    Text("Juice")
                                }
                            }
                    }).foregroundStyle(.black)
                    
                    Button(action: {
                        if otherProgress < 1{
                        otherProgress = (otherProgress * 10.0 + 1.0).rounded() / 10.0
                        } else{
                            otherProgress = 1
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .shadow(color: .cyan, radius: 5, x: 1, y: 1)
                            .frame(width: 110, height: 160)
                            .foregroundStyle(.white)
                            .overlay {
                                VStack{
                                    Image("other")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60)
                                    Text("Other")
                                }
                            }
                    }).foregroundStyle(.black)
                    
                    
                }
                
                Button(action: {
                    withAnimation{
                        self.showAlert.toggle()
                    }
                    
                }, label: {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 200, height: 60)
                        .foregroundStyle(.cyan)
                        .overlay {
                            Text("Calculate")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                }).foregroundStyle(.white)

            }
            if showAlert{
                
                AlertView(bodyText: .constant(getHydrationStatus()), caffeine: .constant(getCaffeine()), calories: .constant(getCalories()), presentAlert: $showAlert, waterProgress: $waterProgress, teaProgress: $teaProgress, coffeeProgress: $coffeeProgress, juiceProgress: $juiceProgress, otherProgress: $otherProgress) {
                    withAnimation{
                        showAlert.toggle()
                    }
                } rightButtonAction: {
                    withAnimation{
                        showAlert.toggle()
                    }
                }
                
            }
        }
    }
    
    func getHydrationStatus() -> String{
        var hydration:String {
            if (waterProgress*10.0) <= 5 {
                "Unhydrated"
            } else {
                "Hydrated"
            }
        }
        return hydration
    }
    
    func getCaffeine() -> Double{
        var caffeine: Double{
            (coffeeProgress * 10.0) * 95
        }
        return caffeine
    }
    func getCalories() -> Double{
        var calories: Double{
            (juiceProgress * 10.0) * 100
        }
        return calories
    }

}


