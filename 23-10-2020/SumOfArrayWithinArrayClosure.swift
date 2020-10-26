//Using closure
let arraySumClosure = {
    (list: [[Int]]) -> Int
    in
    
    var sum = 0
    var array = [Int]()
    
    for i in 0..<list.count {
        array = list[i]
        for j in 0..<array.count {
            sum += array[j]
        }
    } 
    
    return sum
}

let numbers = [[4, 3, 7, 2], [6, 9, 1], [1, 4, 7, 2]]
let finalSum = arraySumClosure(numbers)
print("The tolal sum = \(finalSum)")
