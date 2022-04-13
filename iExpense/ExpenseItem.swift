/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/building-a-list-we-can-delete-from
/// https://www.hackingwithswift.com/books/ios-swiftui/working-with-identifiable-items-in-swiftui

import Foundation


struct ExpenseItem: Identifiable,
                    Codable {
    
    var id = UUID.init()
    let name: String
    let type: String
    let amount: Double
}
