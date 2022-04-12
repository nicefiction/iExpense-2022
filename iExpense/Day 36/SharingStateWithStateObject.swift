/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/sharing-swiftui-state-with-stateobject
/// `STEP 1`
/// Make a class that conforms to the `ObservableObject` protocol.
/// `STEP 2`
/// Mark some properties with `@Published` so that any views using the class get updated when they change.
/// `STEP 3`
/// Create an instance of our class using the `@StateObject `property wrapper.

import SwiftUI

class Human: ObservableObject {
    /// `@Published` tells Swift that whenever either of those two properties changes,
    /// it should send an announcement out to any SwiftUI views
    /// that are watching that they should reload.
    @Published var firstName: String = "Dorothy"
    @Published var lastName: String = "Gale"
}



struct Host: View {
    /// When creating the shared data use `@StateObject`,
    /// but when you’re just using it in a different view
    /// you should use `@ObservedObject` instead.
    @ObservedObject var human: Human
    /// `@StateObject` tells SwiftUI that we’re creating a new class instance
    /// that should be watched for any change announcements,
    /// but that should only be used
    /// when you’re creating the object
    /// like we are with our `User` instance.
    
    var body: some View {
        Text("hello world")
    }
}



struct SharingStateWithStateObject: View {
    
    // MARK: - PROPERTY WRAPPERS
    /// `@StateObject` tells SwiftUI that we’re creating a new class instance
    /// that should be watched for any change announcements.
    @StateObject var human = Human.init()
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Form {
            HStack {
                Spacer()
                Text("\(human.firstName) \(human.lastName)")
                    .font(.title)
                    .bold()
                Spacer()
            }
            TextField("Firstname...", text: $human.firstName)
            TextField("Change lastname", text: $human.lastName)
        }
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct SharingStateWithStateObject_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SharingStateWithStateObject()
    }
}
