func arraySum(list: [[Int]]) -> Int {
    var sum = 0
    var array = [Int]()
    
    for i in 0..<list.count {
        array = list[i]
        for j in 0..<array.count {
            sum = sum + array[j]
        }
    } 
    
    return sum
}

let number = [[4, 3, 7, 2], [6, 9, 1], [1, 4, 7, 2]]
let result = arraySum(list: number)
print("The tolal sum = \(result)")
