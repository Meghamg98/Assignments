class Movie {
    var name: String = ""
    var price: Int = 0
    var genre: String = ""
    var numberOfSeats: Int = 0
}

let myTicket = Movie()
let availableSeats = 5

func myTicketBooking() {
    print("Name\t \t: \(myTicket.name) ")
    print("Price\t\t: \(myTicket.price) ")
    print("Genre  \t\t: \(myTicket.genre) ")
    print("Number of Seats : \(myTicket.numberOfSeats) ")
    
    if(myTicket.numberOfSeats < availableSeats ) {
        print("Seats are available")
    } else {
        print("Oh!Sorry.. We are booked")
    }
}

print("-------My First Ticket Booking------- ")
myTicket.name = "Inception"
myTicket.price = 250
myTicket.genre = "Sci-Fi"
myTicket.numberOfSeats = 2
print(myTicketBooking())

print("\n-------My Second Ticket Booking------- ")
myTicket.name = "Frozen"
myTicket.price = 135
myTicket.genre = "Animated"
myTicket.numberOfSeats = 5
print(myTicketBooking())
