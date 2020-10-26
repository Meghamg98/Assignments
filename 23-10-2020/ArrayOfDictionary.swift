var arrayOfDictionary = [[String: Any]]()
var finalArray = [Any]()

arrayOfDictionary = [
    [
      "Name": "ABC",
      "Age": 20,
      "Branch": "ECE"
    ],
    [
      "Name": "DEF",
      "Age": 21,
      "Branch": "CSE"
    ],
    [
      "Name": "GHI",
      "Age": 22,
      "Branch": "IS"
    ]
]

func arrayOfDictionaryFunction(array: [[String: Any]]) -> [Any] {
    let keyArray = [String](arrayOfDictionary[0].keys)
    
    for j in 0..<array.count {
        if let value = array[j][keyArray[0]] {
            finalArray.append(value) 
        }
        if let value = array[j][keyArray[1]] {
            finalArray.append(value) 
        }
        if let value = array[j][keyArray[2]] {
            finalArray.append(value) 
        }
    }
    
    return finalArray
}

let resultString = arrayOfDictionaryFunction(array: arrayOfDictionary)
print("The values of given array of dictionary are : \n\(resultString)")
