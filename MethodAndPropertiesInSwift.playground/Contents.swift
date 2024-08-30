import Foundation

/*:
 # Properties and Methods in Swift: A Deep Dive

 ## Introduction
 Understanding properties and methods in Swift is essential for developing robust iOS applications. This guide will provide real-life examples to help you understand how to implement and use these features effectively.

 This note was written by Amitesh Mani Tiwari.
 If you need help or have questions, feel free to contact me at:
 amiteshmanitiwari1997@gmail.com
*/

//: # Mastering Swift Properties and Methods: Playground Example

//: ## 1. Stored Properties

// Stored properties are used to store constants and variables as part of an instance.
class UserProfile {
    var username: String
    var age: Int
    
    init(username: String, age: Int) {
        self.username = username
        self.age = age
    }
}

let user1 = UserProfile(username: "AmiTiwari", age: 25)
print("Username: \(user1.username), Age: \(user1.age)")

// Explanation: Stored properties `username` and `age` are directly associated with each instance of `UserProfile`. These properties store the user’s information.

//: ## 2. Computed Properties

// Computed properties calculate values rather than store them directly.
class ShoppingCart {
    var items: [String] = []
    
    var itemCount: Int {
        return items.count
    }
    
    func addItem(_ item: String) {
        items.append(item)
    }
}

let cart = ShoppingCart()
cart.addItem("iPhone")
cart.addItem("MacBook")
print("Total items in the cart: \(cart.itemCount)")

// Explanation: `itemCount` is a computed property that calculates the total number of items in the cart. It doesn't store the value directly but computes it based on the items array.

//: ## 3. Lazy Stored Properties

// Lazy properties are initialized only when they are accessed for the first time.
class DataFetcher {
    lazy var data: [String] = fetchDataFromServer()
    
    func fetchDataFromServer() -> [String] {
        print("Fetching data from server...")
        return ["Data1", "Data2", "Data3"]
    }
}

let fetcher = DataFetcher()
print(fetcher.data)

// Explanation: The `data` property is lazy, meaning it's only fetched when it's accessed for the first time. This is useful for expensive operations like data fetching.

//: ## 4. Property Observers

// Property observers allow you to monitor changes to a property’s value.
class VolumeController {
    var volume: Int = 0 {
        willSet {
            print("Volume will change to \(newValue)")
        }
        didSet {
            print("Volume changed from \(oldValue) to \(volume)")
        }
    }
}

let volumeController = VolumeController()
volumeController.volume = 5
volumeController.volume = 10

// Explanation: Property observers `willSet` and `didSet` are used to perform actions before and after the property `volume` is changed. This is useful for validation or triggering other updates.

//: ## 5. Instance Methods

// Instance methods are functions that belong to an instance of a class, structure, or enumeration.
class MusicPlayer {
    var currentTrack: String?
    
    func play(track: String) {
        currentTrack = track
        print("Playing \(track)")
    }
    
    func stop() {
        print("Stopping \(currentTrack ?? "no track")")
        currentTrack = nil
    }
}

let player = MusicPlayer()
player.play(track: "Shape of You")
player.stop()

// Explanation: `play` and `stop` are instance methods of the `MusicPlayer` class. They perform actions related to the current instance, such as playing and stopping a track.

//: ## 6. Type Methods

// Type methods are functions that are called on the type itself, not on an instance.
class AppConfig {
    static var appVersion: String = "1.0.0"
    
    static func updateVersion(to version: String) {
        appVersion = version
        print("App version updated to \(appVersion)")
    }
}

AppConfig.updateVersion(to: "1.0.1")
print("Current app version: \(AppConfig.appVersion)")

// Explanation: `updateVersion` is a type method that updates the app version for all instances. It’s called on the type `AppConfig`, not on an instance.

//: ## 7. Mutating Methods in Structs

// Mutating methods in structs can modify the properties of the struct.
struct Task {
    var title: String
    var isCompleted: Bool = false
    
    mutating func complete() {
        isCompleted = true
    }
}

var task = Task(title: "Finish Swift tutorial")
task.complete()
print("Task: \(task.title), Completed: \(task.isCompleted)")

// Explanation: `complete` is a mutating method that changes the `isCompleted` property of the `Task` struct. In structs, you need the `mutating` keyword to modify properties within methods.

//: ## 8. Choosing Between Structs and Classes

// Structs are value types, and classes are reference types. Choose based on whether you need shared state or independent instances.
struct Coordinate {
    var latitude: Double
    var longitude: Double
}

var locationA = Coordinate(latitude: 37.7749, longitude: -122.4194)
var locationB = locationA // Deep copy, separate instances
locationB.latitude = 40.7128

print("Location A: \(locationA.latitude), \(locationA.longitude)")
print("Location B: \(locationB.latitude), \(locationB.longitude)")

// Explanation: `Coordinate` is a struct, so `locationA` and `locationB` are independent instances. Modifying `locationB` does not affect `locationA`.

class UserSettings {
    var theme: String = "Light"
}

let settingsA = UserSettings()
let settingsB = settingsA // Shallow copy, shared reference

settingsB.theme = "Dark"
print("Settings A Theme: \(settingsA.theme)")
print("Settings B Theme: \(settingsB.theme)")

// Explanation: `UserSettings` is a class, so `settingsA` and `settingsB` share the same instance. Modifying `settingsB` also affects `settingsA`.
