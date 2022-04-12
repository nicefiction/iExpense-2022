/// SOURCE: https://www.hackingwithswift.com/books/ios-swiftui/why-state-only-works-with-structs

import SwiftUI


struct User {
    
    var firstName: String = "Dorothy"
    var lastName: String = "Gale"
}



struct WhyStateOnlyWorksWithStructs: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var user = User.init()
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Form {
            HStack {
                Spacer()
                Text("\(user.firstName) \(user.lastName)")
                    .font(.title)
                    .bold()
                Spacer()
            }
            TextField("Change firstname...",
                      text: $user.firstName)
            TextField("Change lastname...",
                      text: $user.lastName)
        }
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct WhyStateOnlyWorksWithStructs_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WhyStateOnlyWorksWithStructs()
    }
}
