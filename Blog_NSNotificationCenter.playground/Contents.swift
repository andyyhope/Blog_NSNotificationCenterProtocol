import Foundation

// MARK: - Protocol

public protocol Notifier {
    associatedtype Notification: RawRepresentable
}

public extension Notifier where Notification.RawValue == String {
    
    // MARK: - Static Computed Variables
    
    private static func nameFor(notification: Notification) -> String {
        return "\(self).\(notification.rawValue)"
    }
    
    
    // MARK: - Instance Methods
    
    // Pot
    
    func postNotification(notification: Notification, object: AnyObject? = nil) {
        Self.postNotification(notification, object: object)
    }
    
    func postNotification(notification: Notification, object: AnyObject? = nil, userInfo: [String : AnyObject]? = nil) {
        Self.postNotification(notification, object: object, userInfo: userInfo)
    }
    
    
    // MARK: - Static Function
    
    // Post
    
    static func postNotification(notification: Notification, object: AnyObject? = nil, userInfo: [String : AnyObject]? = nil) {
        let name = nameFor(notification)
        
        NSNotificationCenter.defaultCenter()
            .postNotificationName(name, object: object, userInfo: userInfo)
    }
    
    // Add
    
    static func addObserver(observer: AnyObject, selector: Selector, notification: Notification) {
        let name = nameFor(notification)
        
        NSNotificationCenter.defaultCenter()
            .addObserver(observer, selector: selector, name: name, object: nil)
    }
    
    // Remove
    
    static func removeObserver(observer: AnyObject, notification: Notification, object: AnyObject? = nil) {
        let name = nameFor(notification)
        
        NSNotificationCenter.defaultCenter()
            .removeObserver(observer, name: name, object: object)
    }
}


// MARK: - Example

class Barista : Notifier {
    enum Notification : String {
        case makeCoffee
    }
}

extension Selector {
    static let makeCoffeeNotification = #selector(Customer.drink(_:))
}

class Customer {
    @objc func drink(notification: NSNotification) {
        print("Mmm... Coffee")
    }
}


let customer = Customer()

Barista.addObserver(customer, selector: .makeCoffeeNotification, notification: .makeCoffee)

Barista.postNotification(.makeCoffee)
// prints: Mmm... Coffee

Barista.removeObserver(customer, notification: .makeCoffee)



