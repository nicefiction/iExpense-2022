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
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        NavigationView {
            List {
                ForEach(expenses.items) { (item: ExpenseItem) in
                    Text("\(item.name)")
                }
                        .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button(action: {
                    let expenseItem = ExpenseItem.init(name: "Test",
                                                       type: "Personal",
                                                       amount: 1.00)
                    expenses.items.append(expenseItem)
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                })
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
