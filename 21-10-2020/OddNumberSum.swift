//Using Function
func oddNumberSum(inputNumber: UInt) {
    var index = 1, sum = 0

    if(inputNumber % 2 != 0) {
        while(index <= inputNumber) {
            sum = sum + index
            print("For odd numbers till \(index) the summation is \(sum)")
            index = index + 2
        }
        print("\nThe total sum is = \(sum)")
    }
    else
    {
        print("Please enter an Odd positive integer")
    }
}

oddNumberSum(inputNumber: 7)




//Using Closure
let oddNumberSumClosure = {
    (inputNumber: UInt)
    in
    
    var index = 1, sum = 0

    if(inputNumber % 2 != 0) {
        while(index <= inputNumber) {
            sum = sum + index
            print("For odd numbers till \(index), the summation is \(sum)")
            index = index + 2
        }
        print("\nThe total sum is = \(sum)")
    }
    else
    {
        print("Please enter an Odd positive integer")
    }
}

oddNumberSumClosure(5)
