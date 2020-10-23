func power(base: Int, exponential: Int) -> Int {
    var result = 0
    
    if (exponential == 0) {
        result = 1
    } else if (exponential == 1) {
        result = base
    } else {
        result = base * power(base: base, exponential: exponential - 1)   
    }
    return result   
}

print(" The result is \(power(base: 8 , exponential: 2))")
