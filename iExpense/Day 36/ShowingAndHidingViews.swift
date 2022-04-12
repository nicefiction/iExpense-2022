/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/showing-and-hiding-views

import SwiftUI



struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var name: String
    
    
    var body: some View {
        
        VStack {
            Text("Hello \(name)")
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}



struct ShowingAndHidingViews: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var isShowigSheet: Bool = false
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Button("Show Sheet") {
            isShowigSheet.toggle()
        }
        .sheet(isPresented: $isShowigSheet) {
            SecondView(name: "Dorothy Gale")
        }
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct ShowingAndHidingViews_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ShowingAndHidingViews()
            .preferredColorScheme(.dark)
    }
}
