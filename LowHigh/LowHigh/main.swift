//
//  main.swift
//  LowHigh
//
//  Created by 이동영 on 30/06/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

//=====================================================================
//                              Low-High
//=====================================================================
//      Low-High 는 사용자로부터 숫자를 입력받아 랜덤(1~100)으로 생성된 값과 비교하여,
//      큰 값이 입력되면 High
//      작은 값이 입력되면 Low
//      같으면 Correct! 를 출력합니다.
//      Correct 출력 시 시도했던 횟수를 함께 출력합니다.
//      수행은 Correct가 될 때까지 무한반복됩니다.
//      숫자가 입력되지 않으면 Wrong 을 출력합니다.
//=====================================================================

///=========================================
///             (non-FP) - my
///=========================================
//
//let random = { Int.random(in: 1...100) }
//let fetchInput = { Int(readLine()!) ?? -1 }
//let anwser = random()
//var count = 0
//var input: Int
//
//repeat {
//    input = fetchInput()
//    count+=1
//    var message = ""
//    if input < anwser {
//        message = "Low"
//    }
//    else if input > anwser {
//        message = "High"
//    }
//    else if input == anwser{
//        message = "Correct! \(count)번 시도"
//    }
//    else {
//      message = "Wrong"
//    }
//    print(message)
//
//}while input != anwser

///=========================================
///             (non-FP)
///=========================================
//
//let answer = Int(arc4random() % 100) + 1
//var count = 0
//
//while true {
//
//    let userInput = readLine()
//
//    guard let unwrappedInput = userInput, let inputNumber = Int(unwrappedInput) else {
//        print("Wrong")
//        continue
//    }
//
//    if inputNumber == answer {
//        print("Correct! : \(count)")
//        break
//    }
//
//    if inputNumber > answer {
//        print("High")
//    }
//
//    if inputNumber < answer {
//        print("Low")
//    }
//
//    count += 1
//}
///=========================================
///                 1
///=========================================
func random (min: Int, max: Int) -> Int {
    return Int(arc4random()) % (max-min) + min
}

enum Result: String {
    case wrong = "Wrong"
    case correct = "Correct!"
    case low = "Low"
    case high = "High"
}

func inputAndCheck(_ answer: Int) -> () -> Bool { return { printResult(evaluate(answer)) } }

func evaluate(_ answer: Int) -> Result {
    guard let num = Int(readLine() ?? "") else { return .wrong }
    if num > answer { return .high }
    if num < answer { return .low }
    return .correct
}

func printResult(_ r: Result) -> Bool {
    if r == .correct { return false }
    print(r.rawValue)
    return true
}

let corrected: (Int) -> Void = { print("Correct!: \($0)") }

func countingLoop (_ needContinue: @escaping () -> Bool, _ finished: (Int) -> Void) {
    func counter(_ c: Int = 0) -> Int {
         if !needContinue() { return c+1 }
        return counter(c+1)
    }
    finished(counter(0))
}

countingLoop(inputAndCheck(random(min: 0, max: 100)), corrected)
