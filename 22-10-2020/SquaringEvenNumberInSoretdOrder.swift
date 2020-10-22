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
