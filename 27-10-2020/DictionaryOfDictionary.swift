import Foundation

let students = [
    "ABC001": [
        "Name": "ABC",
        "Age": 20,
        "Branch": "ECE",
        "Marks": [
            "Physics": 30,
            "Chemistry": 40,
            "Maths": 50
        ]
    ],
    "ABC002": [
        "Name": "DEF",
        "Age": 21,
        "Branch": "CS",
        "Marks": [
            "Physics": 31,
            "Chemistry": 41,
            "Maths": 51
        ]
    ],
    "ABC003": [
        "Name": "GHI",
        "Age": 22,
        "Branch": "IS",
        "Marks": [
            "Physics": 32,
            "Chemistry": 42,
            "Maths": 52
        ]
    ]
]  
let accessKey = "ABC003:Marks:Physics"

let keys = accessKey.components(separatedBy: ":")
var dict: [String: Any] = students

var result: Any?
var isFound: Bool = true

for (index, key) in keys.enumerated() {

    if let temp = dict[key] as? [String: Any] {
        dict = temp
    } else {
        if (index == keys.count-1 && dict.keys.contains(key)) {
            if let temp = dict[key]  {
                result = temp
            }
        } else {
            isFound = false
            break
        }
    }
}

if let result = result {
    print(result)
}
