/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Subscripts can now declare default arguments

When adding custom subscripts to a type, you can now use default arguments for any of the parameters. For example, if we had a `PoliceForce` struct with a custom subscript to read officers from the force, we could add a `default` parameter to send back if someone tries to read an index outside of the array’s bounds:
*/
struct PoliceForce {
    var officers: [String]
        
    subscript(index: Int, default default: String = "Unknown") -> String {
        if index >= 0 && index < officers.count {
            return officers[index]
        } else {
            return `default`
        }
    }
}

let force = PoliceForce(officers: ["Amy", "Jake", "Rosa", "Terry"])
print(force[0])
print(force[5])
/*:
That will print “Amy” then “Unknown”, with the latter being caused because there is no officer at index 5. Note that you do need to write your parameter labels twice if you want them to be used, because subscripts don’t use parameter labels otherwise.

So, because I use `default default` in my subscript, I can use a custom value like this:
*/
print(force[-1, default: "The Vulture"])
/*:

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/
