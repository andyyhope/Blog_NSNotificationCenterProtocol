![](https://cdn-images-1.medium.com/max/1600/1*xafc2qaYdM7ZOheYWaMmQA.png)

# Swift: NSNotifcationCenter protocol
## Observer pattern made better-er

NSNotificationCenter has been around since the dawn of the iOS SDK and it’s been a popular tool amongst developers for just as long. For those who dont know, it’s based off the concept conveniently named “Observer pattern”, which is part of the behavioural group of software design patterns.

````
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
````

#### Read more
[Swift Functional Programming: Kinda like reverse Fight Club for developers](https://medium.com/p/a6b0c3937d56/)
