func songInDescendingOrder(number: Int) {
    var descendingCount = number
    let bottles = "bottles of water"

    while(descendingCount >= 1) {
        print("\(descendingCount) \(bottles) on the wall,\n\(descendingCount) \(bottles),\nya’ take one down, ya’ pass it around,\n\(descendingCount-1) \(bottles) on the wall.\n")
        descendingCount = descendingCount - 1
    }
    
    print("No bottles of water on the wall,\nno bottles of water,\nya’ can’t take one down, ya’ can’t pass it around,\n’cause there are no more bottles of water on the wall!") 
}

songInDescendingOrder(number:99)