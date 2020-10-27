import Foundation
  
func arraySum(list: [Any]) -> Int {
    var sum = 0
    
    for i in list {
        if let temp = i as? [Any] {
            sum = sum + arraySum(list: temp)
        } else {
            if let temp = i as? Int {
                sum = sum + temp
            }
        }
    } 
    
    return sum
}

let number = [[4, 3, 7, 2], 
              [6, 9, 1], 
              [
                [1, 4, 7, 2], 
                [5, 8]
              ]
             ]
let result = arraySum(list: number)
print("The tolal sum = \(result)")
