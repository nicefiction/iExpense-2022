/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/building-a-list-we-can-delete-from
/// https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
/// `STEP 1`: Attempt to read the` “Items” `key from `UserDefaults`.
/// `STEP 2`: Create an instance of `JSONDecoder`, which is the counterpart of JSONEncoder that lets us go from JSON data to Swift objects.
/// `STEP 3`: Ask the decoder to convert the data we received from `UserDefaults` into an array of `ExpenseItem` objects.
/// `STEP 4`: If that worked, assign the resulting array to `items` and exit.
/// `STEP 5`: Otherwise, set items to be an empty array.



import Foundation


class Expenses: ObservableObject {
    
    // MARK: - PROPERTY WRAPPERS
    @Published var items = Array<ExpenseItem>() {
        didSet {
            let jsonEncoder = JSONEncoder.init()
            
            if let _encodedData = try? jsonEncoder.encode(items) {
                UserDefaults.standard.set(_encodedData,
                                          forKey: "Items")
            }
        }
    }
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    init() {
        /// `STEP 1`:
        if let _savedData = UserDefaults.standard.data(forKey: "Items") {
            /// `STEP 2`:
            let jsonDecoder = JSONDecoder.init()
            /// `STEP 3`:
            /// What does the `.self` mean?
            /// Well, if we had just used `[ExpenseItem]`,
            /// Swift would want to know what we meant
            /// – are we trying to make a copy of the class?
            /// Were we planning to reference a static property or method?
            /// Did we perhaps mean to create an instance of the class?
            /// To avoid confusion – to say that we mean we’re referring to the type itself, known as the type object –
            /// we write `.self` after it:
            if let _decodedData = try? jsonDecoder.decode([ExpenseItem].self,
                                                          from: _savedData) {
                /// `STEP 4`:
                self.items = _decodedData
                return
            }
        }
        /// `STEP 5`:
        /// PAUL:
        // items = Array<ExpenseItem>()
        /// OLIVIER:
        self.items = items
    }
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}
