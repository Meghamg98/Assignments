//Using Closure
let songInDescendingOrderClosure = {
    (number: Int)
    in
    
    var descendingCount = number
    let bottles = "bottles of water"

     if(number<0) {
        print("Please enter a positer Integer")
    } else {
        while(descendingCount >= 1) {
            print("\(descendingCount) \(bottles) on the wall,\n\(descendingCount) \(bottles),\nya’ take one down, ya’ pass it around,\n\(descendingCount-1) \(bottles) on the wall.\n")
            descendingCount = descendingCount - 1
        }
    
        print("No bottles of water on the wall,\nno bottles of water,\nya’ can’t take one down, ya’ can’t pass it around,\n’cause there are no more bottles of water on the wall!") 
    }
}

songInDescendingOrderClosure(99)
