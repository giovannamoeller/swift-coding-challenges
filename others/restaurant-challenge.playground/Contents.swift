import UIKit

// Coding challenge - Classes and Classes Hierarchity

class Restaurant {
  var name: String
  var type: [String]
  var ratingAverage: Double
  var delivery: Bool
  var allRatings: [Double]
  
  init(name: String, type: [String], delivery: Bool) {
    self.name = name
    self.type = type
    self.ratingAverage = 0.0
    self.delivery = delivery
    self.allRatings = []
  }
  
  func calculateRating(rating: Double) {
    allRatings.append(rating)
    var sumRatings = 0.0
    for rating in allRatings {
      sumRatings += rating
    }
    ratingAverage = sumRatings / Double(allRatings.count)
  }
}

var bobsBurgers = Restaurant(name: "Bob's Burgers", type: ["Burgers", "Fast Food"], delivery: true)
var laRatatouille = Restaurant(name: "La Ratatouille", type: ["French"], delivery: false)

class Order {
  var restaurant: Restaurant
  var items: [String]
  var subtotal: Double
  var tip: Double
  var total: Double {
    (1 + tip) * subtotal
  }
  var clientRating: Double
  
  init(restaurant: Restaurant, items: [String], subtotal: Double, tip: Double = 0.0, clientRating: Double) {
    self.restaurant = restaurant
    self.items = items
    self.subtotal = subtotal
    self.tip = tip
    self.clientRating = clientRating
    restaurant.calculateRating(rating: clientRating)
  }

  func printReceipt() {
    print("Items:     \(items)")
    print("Subtotal:  $\(subtotal)")
    print("Tip:       $\(tip)")
    print("Total:     $\(total)")
    print("Rating:    \(clientRating)")
  }
}

var order1 = Order(restaurant: bobsBurgers, items: ["XBurguer", "CocaCola"], subtotal: 47.0, tip: 0.1, clientRating: 4.0)
var order2 = Order(restaurant: bobsBurgers, items: ["XBurguer", "CocaCola"], subtotal: 67.0, clientRating: 1.0)
bobsBurgers.ratingAverage

class DeliveryOrder: Order {
  var deliveryFee = 2.0
  
  override var total: Double {
    (1 + tip) * subtotal + deliveryFee
  }
  
  override init(restaurant: Restaurant, items: [String], subtotal: Double, tip: Double = 0.0, clientRating: Double) {
    super.init(restaurant: restaurant, items: items, subtotal: subtotal, clientRating: clientRating)
  }
  
  override func printReceipt() {
    print("Items:     \(super.items)")
    print("Subtotal:  $\(super.subtotal)")
    print("Tip:       $\(super.tip)")
    print("Total:     $\(super.total)")
    print("Rating:    \(super.clientRating)")
    print("Delivery:  $\(deliveryFee)")
  }
}

var order3 = DeliveryOrder(restaurant: bobsBurgers, items: ["XBurguer", "CocaCola"], subtotal: 56.0, clientRating: 5.0)
order3.total

