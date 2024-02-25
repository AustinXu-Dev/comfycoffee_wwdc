import Foundation

enum ViewType: String{
    case explore = "explore"
    case coffeebeans = "coffeebeans"
    case daily = "daily"
}

struct DataModel: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var description: String
    var image: String
    var viewType: ViewType?
}


