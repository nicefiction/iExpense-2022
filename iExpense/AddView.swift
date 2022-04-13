/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/sharing-an-observed-object-with-a-new-view

import SwiftUI



struct AddView: View {
    
    // MARK: - PROPERTY WRAPPERS
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expenses: Expenses
    
    @State private var name: String = ""
    @State private var selectedType: String = "Personal"
    @State private var amount: Double = 0.00
    
    
    
    // MARK: - PROPERTES
    let expenseTypes: Array<String> = [
        "Personal", "Business"
    ]
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Name...",
                          text: $name)
                Picker("Type...",
                       selection: $selectedType) {
                    ForEach(expenseTypes, id: \.self) { (type: String) in
                        Text(type)
                    }
                }
                       .pickerStyle(.segmented)
                TextField("Quantity...",
                          value: $amount,
                          format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                .keyboardType(.decimalPad)
            }
            .navigationTitle(Text("Add a new expense"))
            .toolbar(content: {
                Button("Save Item",
                       action: {
                    let expenseItem = ExpenseItem.init(name: name,
                                                       type: selectedType,
                                                       amount: amount)
                    expenses.items.append(expenseItem)
                    dismiss()
                })
            })
        }
    }
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddView(expenses: Expenses())
    }
}
