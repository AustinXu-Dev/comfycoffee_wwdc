import SwiftUI

struct CoffeeNavigationData {
    let mainData = [
        DataModel(text: "Prepare Coffees", description: "Make Coffee Step by Step", image: "cup.and.saucer",viewType: .explore),
        DataModel(text: "Daily Checkin",description: "Calculate your consumption",image: "calendar.badge.checkmark", viewType: .daily),
        DataModel(text: "Coffee Beans", description: "Learn more about coffee beans", image: "books.vertical", viewType: .coffeebeans),
    ]
    func subView(for id: DataModel.ID) -> ViewType?{
        guard let subView = mainData.first(where: { $0.id == id}) else{
            return .explore
        }
        return subView.viewType
    }
}
