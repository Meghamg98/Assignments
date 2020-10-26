//With single value
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


//With multiple values
class Restaurant {
    var name: String = ""
    var price: Int = 0
    var quantity: String = ""
    var numberOfOrders: Int = 0
    var isHomeDeliveryAvailable: Bool = true
}

let myFood = Restaurant()

func myOrder() {
    print("Name\t \t: \(myFood.name) ")
    print("Price\t\t: \(myFood.price) ")
    print("Quantity  \t: \(myFood.quantity) ")
    print("Number of Orders: \(myFood.numberOfOrders) ")
    
    if(myFood.isHomeDeliveryAvailable == true) {
        print("Home delivery is available to your adrress")
    } else {
        print("Oh! we do not delivery to your address")
    }
    
}
myFood.name = "Curd Rice"
myFood.price = 200
myFood.quantity = "Small"
myFood.numberOfOrders = 4
myFood.isHomeDeliveryAvailable = true
print("-------My First Order details------- ")
print(myOrder())

myFood.name = "Noodles"
myFood.price = 100
myFood.quantity = "Large"
myFood.numberOfOrders = 2
myFood.isHomeDeliveryAvailable = false
print("-------My Second Order details------- ")
print(myOrder())
