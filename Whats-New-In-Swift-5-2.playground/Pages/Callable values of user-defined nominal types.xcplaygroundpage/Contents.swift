/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Callable values of user-defined nominal types

[SE-0253](https://github.com/apple/swift-evolution/blob/master/proposals/0253-callable.md) introduced introduces statically callable values to Swift, which is a fancy way of saying that you can now call a value directly if its type implements a method named `callAsFunction()`. You don’t need to conform to any special protocol to make this behavior work; you just need to add that method to your type.

For example, we could create a `Dice` struct that has properties for `lowerBound` and `upperBound`, then add `callAsFunction` so that every time you call a dice value you get a random roll:
*/
struct Dice {
    var lowerBound: Int
    var upperBound: Int
        
    func callAsFunction() -> Int {
        (lowerBound...upperBound).randomElement()!
    }
}
    
let d6 = Dice(lowerBound: 1, upperBound: 6)
let roll1 = d6()
print(roll1)
/*:
That will print a random number from 1 through 6, and it’s identical to just using `callAsFunction()` directly. For example, we could call it like this:
*/
let d12 = Dice(lowerBound: 1, upperBound: 12)
let roll2 = d12.callAsFunction()
print(roll2)
/*:
Swift automatically adapts your call sites based on how `callAsFunction()` is defined. For example, you can add as many parameters as you want, you can control the return value, and you can even mark methods as `mutating` if needed.

For example, this creates a `StepCounter` struct that tracks how far someone has walked and reports back whether they reached their target of 10,000 steps:
*/
struct StepCounter {
    var steps = 0
        
    mutating func callAsFunction(count: Int) -> Bool {
        steps += count
        print(steps)
        return steps > 10_000
    }
}
    
var steps = StepCounter()
let targetReached = steps(count: 10)
/*:
For more advanced usage, `callAsFunction()` supports both `throws` and `regrows`, and you can even define multiple `callAsFunction()` methods on a single type – Swift will choose the correct one depending on the call site, just like regular overloading.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/