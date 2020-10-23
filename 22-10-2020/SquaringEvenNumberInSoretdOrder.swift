//Using function
func filteringNumbers(list: [Int]) -> [Int] {
    var resultList = [Int]()
    var result = [Int]()
    
    for (_, value) in list.enumerated() {
        if(value % 2 == 0){
            resultList.append(value)
        }
    }
    //print("Step 1: Filtering Even numbers \(resultList)")
    
    for (_, value) in resultList.enumerated() {
        var square = 0
        square = value * value
        result.append(square)
    }
    //print("Step 2: Sqauring Even numbers \(result)")
    
    result = result.sorted()
    return result
}

let elements=[ 2, 5, 3, 8, 10, 4, 7]
print("The final list obtained :\(filteringNumbers(list: elements))")


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

let numbers = [2, 6, 3, 9, 1, 4, 7]
print("The final list is \(squaringEvenNumbersInAscendingOrder(initialList: numbers, condition: evenClosure) )")
