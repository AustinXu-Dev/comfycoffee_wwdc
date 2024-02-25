//
//  AlertView.swift
//  
//
//  Created by Austin Xu on 2024/2/24.
//

import SwiftUI

struct AlertView: View {
    @Binding var bodyText: String
    @Binding var caffeine: Double
    @Binding var calories: Double
    @Binding var presentAlert: Bool
    
    @Binding var waterProgress: Double
    @Binding var teaProgress: Double
    @Binding var coffeeProgress: Double
    @Binding var juiceProgress: Double
    @Binding var otherProgress: Double
    
    // The alert type being shown
    @State var alertType: AlertType = .success
    
    // based on this value alert buttons will show vertically
    var isShowVerticalButtons = false
    
    var leftButtonAction: (() -> ())?
    var rightButtonAction: (() -> ())?
    
    let verticalButtonsHeight: CGFloat = 80
    
    
    var body: some View {
        
        ZStack{
            Color.black.opacity(0.75)
                            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                    if alertType.title() != "" {

                        // alert title
                        Text("My Daily Report")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(height: 25)
                            .padding(.top, 16)
                            .padding(.bottom, 8)
                            .padding(.horizontal, 16)
                    }

                    // alert message
                
                    VStack(alignment: .center){
                        HStack{
                            Text("Hydration")
                            Spacer()
                            Text(bodyText)
                        }
                        HStack{
                            Text("Caffeine")
                            Spacer()
                            Text("\(Int(caffeine))")
                        }
                        HStack{
                            Text("Calories")
                            Spacer()
                            Text("\(Int(calories))")
                        }
                        
                    }.foregroundStyle(.black)
                    .padding(.horizontal, 50)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .minimumScaleFactor(0.5)
    
                    Divider()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 0.5)
                        .padding(.all, 0)
                    if !isShowVerticalButtons {
                        HStack(spacing: 0) {

                            // left button
                            if (!alertType.leftActionText.isEmpty) {
                                Button {
                                    leftButtonAction?()
                                } label: {
                                    Text("OK")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                }
                                Divider()
                                    .frame(minWidth: 0, maxWidth: 0.5, minHeight: 0, maxHeight: .infinity)
                            }

                            // right button (default)
                            Button {
                                rightButtonAction?()
                                waterProgress = 0.0
                                teaProgress = 0.0
                                coffeeProgress = 0.0
                                juiceProgress = 0.0
                                otherProgress = 0.0
                            } label: {
                                Text("Reset")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.pink)
                                    .multilineTextAlignment(.center)
                                    .padding(15)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            }

                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 55)
                        .padding([.horizontal, .bottom], 0)

                    }
                    else {
                        VStack(spacing: 0) {
                            Spacer()
                            Button {
                                leftButtonAction?()
                            } label: {
                                Text(alertType.leftActionText)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            }
                            Spacer()

                            Divider()

                            Spacer()
                            Button {
                                rightButtonAction?()
                            } label: {
                                Text(alertType.rightActionText)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.pink)
                                    .multilineTextAlignment(.center)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            }
                            Spacer()

                        }
                        .frame(height: verticalButtonsHeight)
                    }
                }
                .frame(width: 370, height: 300)
                .background(
                    Color.white
                )
                .cornerRadius(4)
        }
    }
    
    
}
