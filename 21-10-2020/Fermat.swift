//Using Function
func checkFermat(a: Int, b: Int, c: Int, n: Int) {
    let leftSide = a ^ n + b ^ n  
    let rightSide = c ^ n

    if(n > 2 && leftSide == rightSide) {
        print("Holy smokes, Fermat was wrong!")
    } else {
        print("No, that doesn’t work.")
     }
}

checkFermat(a: 2, b: 4, c: 2, n: 3)

