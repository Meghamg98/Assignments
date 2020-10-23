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
    var list = [Int]()
    var square = 0
    
    for(_, value) in initialList.enumerated() {
        if(condition(value)) {
            square = value * value
            list.append(square)
        }
    }
    list = list.sorted()
    
    return list
}

let numbers = [ 2, 5, 3, 8, 10, 4, 7]
let finalList = squaringEvenNumbersInAscendingOrder(initialList: numbers) {

    $0 % 2 == 0 ? true : false
}

print("The final list is \( finalList)")
