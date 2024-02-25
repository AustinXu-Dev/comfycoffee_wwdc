import SwiftUI

struct ContentView: View {
    @State private var selectedId: DataModel.ID?
    private var dataModel = CoffeeNavigationData()
    
    var body: some View{
        NavigationSplitView{
            List(dataModel.mainData, selection: $selectedId){ item in
                Section {
                    // Use it when you control value with navigation destination
//                    NavigationLink(value: item){
//                    }
                    HStack{
                        Image(systemName: item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                            .padding(.horizontal)
                        VStack(alignment: .leading){
                            Text(item.text)
                            Text(item.description)
                                .font(.system(size: 13))
                                .opacity(0.5)
                        }
                    }.padding(.vertical, 30)
                    
                }
            }
            .navigationTitle("Sidebar")
        } detail: {
            if let selectedId, let subView = dataModel.subView(for: selectedId){
                switch subView{
                case .explore:
                    AnimationView()
                case .daily:
                    TrackerView(waterProgress: 0.0, teaProgress: 0.0, coffeeProgress: 0.0, juiceProgress: 0.0, otherProgress: 0.0)
                case .coffeebeans:
                    CoffeeKnowledgeView()
                }
            } else{
                Text("Please select a category")
            }
        }
    }
}
 
