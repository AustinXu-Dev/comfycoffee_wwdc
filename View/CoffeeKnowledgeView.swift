import SwiftUI

struct CoffeeKnowledgeView: View{
    private var dataModel = CoffeeBeansData()
    @State private var isRowView: Bool = false
    
    private let flexibleColumn = [
        GridItem(.flexible(minimum: 200, maximum: 380)),
        GridItem(.flexible(minimum: 200, maximum: 380)),
        GridItem(.flexible(minimum: 200, maximum: 380))
    ]
        
    
    var body: some View {
        NavigationStack{
            if isRowView{
                rowView()
            } else{
                columnView()
            }
        }
    }
    
    @ViewBuilder
    func columnView() -> some View{
        List{
            LazyVGrid(columns: flexibleColumn, spacing: 10){
                ForEach(dataModel.coffeeBeansData, id: \.self){ item in
                    VStack(alignment: .leading){
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 230, height: 200)
                        
                        Text(item.beanName)
                            .lineLimit(1)
                            .fontWeight(.bold)
                        Text(item.description)
                            .lineLimit(4)
                            .opacity(0.5)
                    }.frame(width: 230, height: 400)
                }
            }.padding(.horizontal)
        }.navigationTitle("Coffee Beans")
            .toolbar{
                Button {
                    self.isRowView.toggle()
                } label: {
                    Image(systemName: isRowView ? "square.split.1x2" : "square.split.2x1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }

            }

    }
    
    @ViewBuilder
    func rowView() -> some View{
        List(dataModel.coffeeBeansData, id: \.self){ item in
            VStack{
                HStack{
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    VStack(alignment: .leading){
                        Text(item.beanName)
                            .fontWeight(.bold)
                        Text(item.description)
                            .lineLimit(2)
                            .opacity(0.5)
                    }.padding(.leading, 5)
                }
            }
        }.navigationTitle("Coffee Beans")
            .toolbar{
                Button {
                    self.isRowView.toggle()
                } label: {
                    Image(systemName: isRowView ? "square.split.1x2" : "square.split.2x1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }

            }
    }
}
