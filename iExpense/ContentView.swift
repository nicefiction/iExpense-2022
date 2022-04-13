/// SOURCE:
///
/// `@Published` publishes change announcements automatically.
/// `@StateObject` watches for those announcements
/// and refreshes any views using the object.
/// `sheet() `watches a condition we specify
/// and shows or hides a view automatically.
/// `Codable` can convert Swift objects into JSON and back.
/// `UserDefaults` can read and write data
/// so that we can save settings and more instantly.

import SwiftUI



struct ContentView: View {
    
    // MARK: - PROPERTY WRAPPERS
    @StateObject var expenses = Expenses.init()
    
    @State private var isShowingAddView: Bool = false
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { (item: ExpenseItem) in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(item.name)")
                                .font(.subheadline)
                            Text("\(item.type)")
                        }
                        Spacer()
                        Text("\(item.amount, format: .currency(code: "EUR"))")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button(action: {
                    isShowingAddView.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                })
            }
            .sheet(isPresented: $isShowingAddView) {
                AddView(expenses: expenses)
            }
        }
    }
    
    
    
    // MARK: - METHODS
    func removeItems(at offsets: IndexSet)
    -> Void {
        
        expenses.items.remove(atOffsets: offsets)
    }
    
    
    
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
