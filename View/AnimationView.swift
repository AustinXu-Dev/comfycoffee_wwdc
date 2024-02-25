//
//  AnimationView.swift
//  wwdc_comfycoffee
//
//  Created by Austin Xu on 2024/2/10.
//

import SwiftUI

struct AnimationView: View {
    
    // Gesture properties
    @State var offsetY: CGFloat = 0
    @State var currentIndex: CGFloat = 0
    
    var body: some View {
        NavigationStack{
            GeometryReader{
                let size = $0.size
                
                let cardSize = size.width;
                
                // Bottom gradient background
//                LinearGradient(colors: [
//                    .primary,
//                    Color.brown.opacity(0.2),
//                    Color.brown.opacity(0.45),
//                    Color.brown
//                ], startPoint: .top, endPoint: .bottom)
//                .frame(height: 300)
//                .frame(maxHeight: .infinity, alignment: .bottom)
//                .ignoresSafeArea()
                
                // MARK: Header view
                HeaderView()
                
                VStack(spacing: 0){
                    ForEach(coffees){ coffee in
                        CoffeeView(coffee: coffee, size: size)
                    }
                }
                .frame(width: size.width)
                .padding(.top, size.height - cardSize)
                .offset(y: offsetY)
                .offset(y: -currentIndex * cardSize)
            }
            
            .coordinateSpace(name: "SCROLL")
            .contentShape(Rectangle())
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        offsetY = value.translation.height
                    }).onEnded({ value in
                        let translation = value.translation.height
                        
                        withAnimation {
                            if translation > 0{
                                if currentIndex > 0 && translation > 250{
                                    currentIndex -= 1
                                }
                            } else{
                                if currentIndex < CGFloat(coffees.count - 1) && -translation > 250{
                                    currentIndex += 1
                                }
                            }
                            offsetY = .zero
                            
                        }
                        
                        
                    })
            )
            .preferredColorScheme(.none)
        }.navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    func HeaderView() -> some View{
        VStack{
            GeometryReader{
                let size = $0.size
                
                HStack(spacing: 0){
                    ForEach(coffees){coffee in
                        VStack(spacing: 15){
                            Text(coffee.name)
                                .font(.title.bold())
                                .multilineTextAlignment(.center)
                            
                            NavigationLink(destination: CoffeePreparationView(coffee: coffee, totalDuration: coffee.duration*60,duration:coffee.duration*60)
                            ) {
                                Text("Start Making Coffee")
                            }
                        }
                        .frame(width: size.width)
                    }
                }
                .offset(x: currentIndex * -size.width)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8), value: currentIndex)
            }.padding(.top, -5)
        }.padding(15)
    }
}

#Preview {
    AnimationView()
}

struct CoffeeView: View {
    var coffee: Coffee
    var size: CGSize
    var body: some View {
        let cardSize = size.width - 500
        
        let maxCardsDisplaySize = size.width + 2000
        
        GeometryReader{proxy in
            let _size = proxy.size
            let offset = proxy.frame(in: .named("SCROLL")).minY - (size.height - 150)
            let scale = offset <= 0 ? (offset / maxCardsDisplaySize): 0
            let reducedScale = 1 + scale
            let currentCardScale = offset / cardSize
            
            VStack(alignment: .center){
                Image(coffee.coffeeImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: _size.width, height: _size.height-100)
                    .scaleEffect(reducedScale < 0 ? 0.001 : reducedScale, anchor: .init(x: 0.5, y: 1-(currentCardScale / 2.3)))
                    .scaleEffect(offset > 0 ? 1+currentCardScale : 1, anchor: .top)

                    .offset(y: offset > 0 ? currentCardScale * 100: 0)
            }
            
        }
        .frame(height: size.width)
    }
}
