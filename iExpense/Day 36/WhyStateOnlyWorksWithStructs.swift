/// SOURCE: https://www.hackingwithswift.com/books/ios-swiftui/why-state-only-works-with-structs
/// SwiftUI’s `State` property wrapper is designed for simple data that is local to the current view,
/// but as soon as you want to share data between views
/// it stops being useful.
/// When we use `@State`,
/// we’re asking SwiftUI to watch a property for changes.
/// So, if we change a string, flip a Boolean, add to an array, and so on,
/// the property has changed and SwiftUI will re-invoke the body property of the view.
/// When `User` was a struct,
/// every time we modified a property of that struct
/// Swift was actually creating a new instance of the struct.
///`@State` was able to spot that change, and automatically reloaded our view.
/// Now that we have a class,
/// that behavior no longer happens:
/// Swift can just modify the value directly.
/// When `User` is a class
/// the property itself isn’t changing,
/// so `@State` doesn’t notice anything and can’t reload the view.
/// Yes, the values inside the class are changing,
/// but `@State` doesn’t monitor those,
/// so effectively what’s happening is
/// that the values inside our class
/// are being changed
/// but the view isn’t being reloaded to reflect that change.

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
