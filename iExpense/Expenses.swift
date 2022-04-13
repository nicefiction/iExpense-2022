/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/building-a-list-we-can-delete-from

import Foundation


class Expenses: ObservableObject {
    
    @Published var items = Array<ExpenseItem>()
}
