//
//  CoffeePreparationView.swift
//  wwdc_comfycoffee
//
//  Created by Austin Xu on 2024/2/10.
//

import SwiftUI

struct CoffeePreparationView: View {
    
    @State var coffee: Coffee
    @State var steps: [String] = []
    
    @State var isTimerRunning = false
    @State var startTime = Date()
    
    // The interval difference between total and remaining duration.
    @State var interval = TimeInterval()
    
    // The actual total duration.
    @State var totalDuration: TimeInterval
    
    // The remaining duration.
    @State var duration: TimeInterval
    
    // Timer progress.
    @State var progress = 1.0
    
    // Timer which will publish update every one second.
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State var showAlert = false
    
    
    
    var body: some View {
        VStack {
            if isTimerRunning {
                CoffeeTimerView(progress: $progress, duration: $duration)
            } else {
                ZStack{
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.08)
                        .foregroundStyle(Color("darkblue"))
                        .frame(width: 200, height: 200)
                    Circle()
                        .trim(from: 0.0, to: progress)
                        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.degrees(270.0))
                        .foregroundStyle(.blue)
                        .frame(width: 200, height: 200)
                    Text(duration.format(using: [.minute, .second]))
                        .font(.title2.bold())
                        .foregroundStyle(.blue)
                        .contentTransition(.numericText())
                }
            }
            
            Divider()
            Spacer().frame(height: 100)
            VStack(alignment: .leading){
                ForEach(steps, id: \.self){ text in
                    Text(text)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .padding(.vertical)
                }
                
            }
            Spacer()
            
            HStack(spacing: 24) {
                Button {
                    //TODO: 1. Add start action
                    // 1. start action
                    startTime = Date()
                    startTimer()
                } label: {
                    Text("Start")
                    Image(systemName: "stopwatch")
                }
                .timerButtonStyle(isValid: !isTimerRunning)
                .disabled(isTimerRunning)
                
                Button {
                    //TODO: 2. Add stop action
                    stopTimer()
                } label: {
                    Text("Stop")
                    Image(systemName: "stop.circle")
                }
                .timerButtonStyle(isValid: isTimerRunning)
                .disabled(!isTimerRunning)
            }
            
            .navigationTitle(coffee.name)
        }
        .padding()
        .onReceive(timer) { time in
            if (isTimerRunning) {
                interval = Date().timeIntervalSince(startTime)
                duration = totalDuration - interval
                progress = (duration / totalDuration)
                
                if duration <= 0 {
                    self.showAlert.toggle()
                    stopTimer()
                }
            }
        }
        .task {
            self.steps = coffee.makingSteps.split(separator: "\n").map { String($0) }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Timer up"), message: Text("Enjoy your coffee"), dismissButton: .cancel())
        }
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        isTimerRunning.toggle()
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
        resetTimer()
        
        isTimerRunning.toggle()
    }
    
    func resetTimer() {
        totalDuration = 120
        duration = 120
        progress = 1.0
    }
}

extension View {
    func timerButtonStyle(isValid: Bool = true) -> some View {
        self
            .font(.title2)
            .padding()
            .background(Color.blue.opacity(isValid ? 1.0 : 0.2))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}



//#Preview {
//    CoffeePreparationView()
//}
