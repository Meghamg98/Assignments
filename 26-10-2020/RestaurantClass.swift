class Restaurant {
    var name = "Ghee Rice"
    var price = 200
    var quantity = "Mini"
    var numberOfOrders = 3
    var isHomeDeliveryAvailable = true
}

let myFood = Restaurant()

print("-------My Food Order details------- ")
print("Name\t \t: \(myFood.name) ")
print("Price\t\t: \(myFood.price) ")
print("Quantity  \t: \(myFood.quantity) ")
print("Number of Orders: \(myFood.numberOfOrders) ")

if(myFood.isHomeDeliveryAvailable == true) {
    print("Home delivery is available to your adrress")
} else {
    print("Oh! we do not delivery to your address")
}


