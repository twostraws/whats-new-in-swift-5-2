/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Key Path Expressions as Functions

[SE-0249](https://github.com/apple/swift-evolution/blob/master/proposals/0249-key-path-literal-function-expressions.md) introduced a marvelous shortcut that allows us to use keypaths in a handful of specific circumstances.

The Evolution proposal describes this as being able to use “`\Root.value` wherever functions of `(Root) -> Value` are allowed”, but what it means is that if previously you sent a Car into a method and got back its license plate, you can now use `Car.licensePlate` instead.

This is best understood as an example, so here’s a `User` type that defines four properties:
*/
struct User {
    let name: String
    let age: Int
    let bestFriend: String?
        
    var canVote: Bool {
        age >= 18
    }
}
/*:
We could create some instance of that struct and put them into an array, like this:
*/
let eric = User(name: "Eric Effiong", age: 18, bestFriend: "Otis Milburn")
let maeve = User(name: "Maeve Wiley", age: 19, bestFriend: nil)
let otis = User(name: "Otis Milburn", age: 17, bestFriend: "Eric Effiong")
let users = [eric, maeve, otis]
/*:
Now for the important part: if you want to get an array of all the users names, you can do so by using a key path like this:
*/
let userNames = users.map(\.name)
print(userNames)
/*:
Previously you would have had to write a closure to retrieve the name by hand, like this:
*/
let oldUserNames = users.map { $0.name }
/*:
This same approach works elsewhere – anywhere where previously you would have received a value and passed back one of its properties, you can now use a key path instead. For example, this will return all users who can vote:
*/
let voters = users.filter(\.canVote)
/*:
And this will return all users who have a best friend:
    
*/
let bestFriends = users.compactMap(\.bestFriend)
/*:

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/