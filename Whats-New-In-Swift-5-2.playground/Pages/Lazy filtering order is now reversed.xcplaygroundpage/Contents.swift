/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Lazy filtering order is now reversed

There’s a small change in Swift 5.2 that could potentially cause your functionality to break: if you use a lazy sequence such as an array, and apply filters to it, those filters are now run in the reverse order.

For example, this code below has one filter that selects names that start with S, then a second filter that prints out the name then returns:
*/
let people = ["Arya", "Cersei", "Samwell", "Stannis"]
    .lazy
    .filter { $0.hasPrefix("S") }
    .filter { print($0); return true }
_ = people.count
/*:
That will print “Samwell” and “Stannis”, because after the first filter runs those are the only names that remain to go into the second filter. But *before* Swift 5.2 it would have returned all four names, because the second filter would have been run before the first one. This was confusing, because if you removed the `lazy` then the code would always return just Samwell and Stannis, regardless of Swift version.

This is particularly problematic because the behavior of this depends on where the code is being run: if you run Swift 5.2 code on iOS 13.3 or earlier, or macOS 10.15.3 or earlier, then you’ll get the old backward behavior, but the same code running on newer operating systems will give the new, correct behavior.

So, this is a change that might cause surprise breakages in your code, but hopefully it’s just a short-term inconvenience.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/