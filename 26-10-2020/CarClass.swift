class Car {
    var name = "Renault Duster"
    var color = "Red"
    var numberOfSeats = 5
    var price = 850750.50
    var isAirbagAvailable = false
    
}

let myCar = Car()

print("-------My Car details------- ")
print("Name\t \t: \(myCar.name) ")
print("Color   \t: \(myCar.color) ")
print("Number of Seats : \(myCar.numberOfSeats) ")
print("Price\t\t: \(myCar.price) ")
if(myCar.isAirbagAvailable == true) {
    print("Air bags are available")
} else {
    print("Air bags are not available")
}
