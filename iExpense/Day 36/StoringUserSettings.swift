/// SOURCE:
///  https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults

import SwiftUI



struct StoringUserSettings: View {
    
    // MARK: - PROPERTY WRAPPERS
    /// OPTION 1:
    @State private var number: Int = UserDefaults.standard.integer(forKey: "Tap")
    /// OPTION 2:
    @AppStorage("currentNumber") private var currentNumber: Int = 0
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        HStack {
            /// OPTION 1:
            Button("Tap \(number)") {
                number += 1
                /// Write to `UserDefaults`:
                UserDefaults.standard.set(self.number,
                                          forKey: "Tap")
            }
            .buttonStyle(.bordered)
            /// OPTION 2:
            Button("Tap \(currentNumber)") {
                currentNumber += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct StoringUserSettings_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StoringUserSettings()
    }
}
