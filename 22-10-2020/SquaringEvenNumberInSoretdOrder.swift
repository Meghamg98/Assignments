//Using function
func squaringEvenNumbersInAscendingOrder(initialList: [Int]) -> [Int] {
    var resultList = [Int]()
    
    for (_, value) in initialList.enumerated() {
        if(value % 2 == 0){
            let square = value * value
            resultList.append(square)
        }
    }
    resultList = resultList.sorted()
    
    return resultList
}

let elements=[ 2, 5, 3, 8, 10, 4, 7, 6]
print("The final list obtained :\(squaringEvenNumbersInAscendingOrder(initialList: elements))")


//Using Closure
func squaringEvenNumbersInAscendingOrder(initialList: [Int], condition: (Int) -> Bool) -> [Int] {
    var resultList = [Int]()
    var square = 0
    
    for(_, value) in initialList.enumerated() {
        if(condition(value)) {
            square = value * value
            resultList.append(square)
        }
    }
    resultList = resultList.sorted()
    
    return resultList
}

let evenClosure = {
    (value: Int) -> Bool
    in
    
    if(value % 2 == 0)
    {
        return true
    }
    return false
}

let numbers = [ 2, 5, 3, 8, 10, 4, 7, 6]
print("The final list is \(squaringEvenNumbersInAscendingOrder(initialList: numbers, condition: evenClosure) )")
