// A Quick Introduction to the Swift Language

// For the best results, remember to show the
// Swift timeline so you can see the results
// of the code you write. To enable the timeline,
// select View -> Assistant Editor -> 
// Show Assistant Editor from the menu.

// Through this file, there are several lines of
// code commented out that are examples of things
// you can't do in Swift. You can comment them
// out to see the error messages they generate.


//***** "Hello World" in Swift. *****//
// All of the ceremony
// around the C version of this program: the
// #include, the main() function, is gone.
// Notice that the output from println appears
// in the timeline on the left under Console Output.
println("Hello World")

// println has replaced NSLog(), and strings
// are now represented with double quotes instead
// of requiring an @ sign.


//***** Variables *****//

// Variables are declared with the 'var' keyword
var aWord = "Word"
var aNumber = 5
var aDecimal = 1.2

// Variables can be assigned new values
aWord = "cupcakes"
aNumber = 24
aDecimal = 3.14

// Variables can not be redeclared
// var aWord = "placemat"

// It may look as if the types of C are gone, but
// Swift is still a statically typed language. The
// difference is that Swift is "type inferring", that 
// means it will figure out the actual type from the
// context. Observe by trying to assign a value of
// a new type into one of the above variables

// aWord = 6
// aNumber = "Twenty"
// aDecimal = "3.14"

// Types can be explicitly states in Swift. The original
// variable declarations can also be written as:
// var aWord: String = "Word"
// var aNumber: Int = 5
// var aDecimal: Double = 1.2


//***** Immutable Variables *****//
// Objective-C gaves us mutable and immutable versions of
// common types like strings, dictionaries, and arrays.
// Swift moves this concept to a language level feature.
// Create immutable variables by replacing 'var' with
// the 'let' keyword

let immutableNumber = 7
// immutableNumber = 6 // causes a compiler error

// Where possible, you should prefer 'let' to 'var'.


//***** Fun With Strings *****//
// Swift makes working with strings much easier.
// They can be concatinated via the '+' operator
"Hello " + " " + "World"

// This even works with +=
var name = "Agent"
name += " Smith"

// The string formatting language of NSLog (%d, %@, etc)
// has been replace by simple string inpterpolation where
// the variable you want inserted is wrapped in \()
"My favorite food is \(aWord)"

// You can also put Swift expressions inside of the string interpolation
"1 + 2 = \(1 + 2)"


//***** if/else *****//
// The major new behavior of Swift when dealing with control flow is
// that all conditions must evaluate to the type Bool, which represents
// true or false.

var truthyness: Bool = true
// truthyness = 0 // compiler error, type Bool may only be true or false

if true {
  println("true is a bool")
}

if false {
  println("this is odd...")
} else {
  println("whew false is actually false")
}

// All of the old coditionals from C like ==, >=, <=, etc still work.
// In Swift they return Bools
if 6 < aNumber {
  println("6 < \(aNumber)")
} else {
  println("6 >= \(aNumber)")
}


//***** while/do while *****//
// while and do/while carry over like C, with the added detail that
// their conditions must be of type Bool
var i = 0
while i < 7 {
  ++i
}


//***** for loops *****//
// for loops get a bit of a change. Where in C we had to manually manage
// the iteration variable with code like
// for(int i = 0; i < 5; ++i) { ... }, now instead we use the
// for/in style of iteration like we did when enumerating over strings
// or dictionaries. In order to make this easy, we can use a type known
// as a range to easily generate a list of numbers to loop over
var times = 10
1..times // Numbers 1-9
1...times // Numbers 1-10

println("Printing the range \(1..times)")
for i in 1..times {
  println(i)
}


//***** Arrays *****//
// Swift uses square brackets to create Arrays. The elements of a Swift
// array must all be of the same type. Notice here the type signature
// is Int[].
let nums: Int[] = [1,2,3]
nums[0] // Access array elements with brackets
nums[2] = 6 // Assign array elements (this shouldn't work with let >_<)
println("Printing array \(nums)")
for i in nums {
  println(i)
}
// Notice that even though the array was declared with let, we were
// still able to change the value of an element. Supposedly this
// is going to be changed in a future beta version so that the
// contents of the array will be immutable


//***** Dictionaries *****//
// Dictionary sytax keeps the square brackets, now we specify key value
// pairs as key: value and separate them with commas like so.
var dictionary = [
  "first": "gold",
  "second": "silver",
  "third": "bronze"]

// Note that keys and values can be of any given type, but all keys
// must be of the same type, and all values must be of the same type

// Accessing elements of a dictionary
dictionary["first"]
dictionary["fourth"] // Note that accessing an empy key returns nil


//***** Optionals *****//
// Optionals are a feature that appear in very few languages, and are
// not present in Objective-C. An optional is a type that can be a value,
// or not have a value. To motivate why this might matter, imagine a 
// function that takes a person's name and returns their house number
// as an unsigned integer.
// UInt64 getAddressFromName(String name)
// Now what happens if that person doesn't have an address? We could
// return 0, and then document that 0 means no address. But what if
// somebody gets clever and uses 0 as an address. Or What if we want to
// test if somebody has an address. We could check the condition 
// (address != 0) every time, but now the idea of 0 representing empty is
// littered all over the code. And now every time write a function that
// could return no value, we need to redefine the concept of no value. 

// Instead, optional types build this concept of nothing into the language.
// Every type has a corresponding optional type whose name is the name of
// the type with a '?' appened. So an optional Int is Int?, an optional string
// is String?, etc. So if an Int is a variable that can hold an integer, a
// Int? is a variable that can hold an Integer OR be empty.

var someInt = 6
var optInt: Int? = 6

// someInt = nil // crashes the compiler, Int can't be nil
optInt = nil // compiles fine, Int? can be nil

// Optionals can be used where a Bool is needed, for example in control
// flow statements
if optInt {
  println("optInt has a value")
} else {
  println("optInt was nil")
}

optInt = 6

if optInt {
  println("optInt has a value")
} else {
  println("optInt was nil")
}

// What happens when we try and use an optional as it's wrapped type
// 7 + optInt // will fail to compile, trying to perform Int + Int?

// Instead we need to unwrap the optional by appending a '!'
7 + optInt!

// But what happens if the optional is nil?
optInt = nil
// 7 + optInt! // Program crashes

// To prevent this, there is a common pattern you will see in Swift for
// safely unwrapping optionals
if optInt {
  println("Look at me unwrapping an optiional \(optInt!)")
} else {
  println("Optional was nil")
}

optInt = 6
if optInt {
  println("Look at me unwrapping an optiional \(optInt!)")
} else {
  println("Optional was nil")
}

// You can clean up that annoying '!' character by using optional binding
if let actualInt = optInt {
  println("Look at me unwrapping an optiional \(actualInt)")
} else {
  println("Optional was nil")
}







