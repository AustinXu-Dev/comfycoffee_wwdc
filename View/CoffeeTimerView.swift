import SwiftUI

struct CoffeeTimerView: View {
    
    @Binding var progress: Double
    @Binding var duration: TimeInterval
    
    var body: some View {
        ZStack {
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
    
}



extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? ""
    }
}

#Preview {
    CoffeeTimerView(progress: .constant(0.4), duration: .constant(100))
}
