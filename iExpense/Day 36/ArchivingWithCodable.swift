/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/archiving-swift-objects-with-codable

import SwiftUI


struct AnotherHuman: Codable {
    
    var firstName: String
    var lastName: String
    
    
    
}


struct ArchivingWithCodable: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var anotherHuman = AnotherHuman.init(firstName: "Dororthy",
                                                        lastName: "Gale")
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Button("Save Human") {
            let jsonEncoder = JSONEncoder.init()
            
            if let _encodedData = try? jsonEncoder.encode(anotherHuman) {
                UserDefaults.standard.set(_encodedData,
                                          forKey: "Save Human")
            }
        }
    }
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct ArchivingWithCodable_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ArchivingWithCodable()
    }
}
