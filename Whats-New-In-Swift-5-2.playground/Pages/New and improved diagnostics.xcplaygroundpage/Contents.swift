/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)
# New and improved diagnostics

Swift 5.2 introduced a new diagnostic architecture that aims to improves the quality and precision of error messages issued by Xcode when you make a coding error. This is particularly apparent when working with SwiftUI code, where Swift would often produce false positive error messages.

For an example, consider code like this:
*/
struct ContentView: View {
    @State private var name = 0
        
    var body: some View {
        VStack {
            Text("What is your name?")
            TextField("Name", text: $name)
                .frame(maxWidth: 300)
        }
    }
}
/*:
That attempts to bind a `TextField` view to an integer `@State` property, which is invalid. In Swift 5.1 this caused an error for the `frame()` modifier saying **'Int' is not convertible to 'CGFloat?’**, but in Swift 5.2 and later this correctly identifies the error is the `$name` binding: **Cannot convert value of type 'Binding<Int>' to expected argument type 'Binding<String>’**.

You can find out more about the new diagnostic architecture on the [Swift.org blog](https://swift.org/blog/new-diagnostic-arch-overview/).

&nbsp;

[< Previous](@previous)           [Home](Introduction)
*/