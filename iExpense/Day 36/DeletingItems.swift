/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/deleting-items-using-ondelete

import SwiftUI



struct DeletingItems: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var numbers = Array<Int>()
    @State private var currentNumber: Int = 1
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    HStack {
                        Spacer()
                        Button("Add Row") {
                            numbers.append(currentNumber)
                            currentNumber += 1
                        }
                        Spacer()
                    }
                }
                ForEach(numbers, id: \.self) {
                    Text("Row \($0)")
                }
                .onDelete(perform: deleteRow)
            }
            .navigationTitle("onDelete")
            .toolbar {
                EditButton.init()
            }
        }
    }
    
    
    
    // MARK: - METHODS
    func deleteRow(from offsets: IndexSet)
    -> Void {
        
        numbers.remove(atOffsets: offsets)
    }
    
    
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct DeletingItems_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DeletingItems()
    }
}
