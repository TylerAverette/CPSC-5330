import UIKit

// compounded monthly
let loanAmount1 = 20000
let numberOfPayments1 = 2
let interestRate1 : Float = (4.4 / 100) / 12

// 1 annual payment
let loanAmount2 = 150000
let numberOfPayments2 = 30
let interestRate2 : Float = 5 / 100

print(payment(loanAmount : loanAmount1, numOfPayments: numberOfPayments1, interestRate : interestRate1));
print(payment(loanAmount : loanAmount2, numOfPayments: numberOfPayments2, interestRate : interestRate2));

func payment(loanAmount : Int, numOfPayments : Int, interestRate : Float ) -> Float {
    //let payment = (Float(loanAmount) * interestRate * Float(numOfPayments) + Float(loanAmount)) / Float(numOfPayments)
    let top = interestRate * powf((1 +  interestRate), Float(numOfPayments))
    let bottom  = powf((1 +  interestRate), Float(numOfPayments)) - 1
    let payment = Float(loanAmount) * top / bottom
    return round(payment * 100) / 100.0
}
