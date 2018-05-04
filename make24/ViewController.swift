//
//  ViewController.swift
//  make24
//
//  Created by Adam on 5/3/18.
//  Copyright © 2018 Zihan Ke & Yishi Chen. All rights reserved.
//

import UIKit

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}


var num1:Double = 0
var num2:Double = 0
var num3:Double = 0
var num4:Double = 0

class ViewController: UIViewController {

    @IBOutlet weak var btnNum1: UIButton!
    @IBOutlet weak var btnNum2: UIButton!
    @IBOutlet weak var btnNum3: UIButton!
    @IBOutlet weak var btnNum4: UIButton!
    
    @IBOutlet weak var btnDone: UIButton!
    
    @IBOutlet weak var timeCount: UILabel!
    @IBOutlet weak var succeededTimes: UILabel!
    @IBOutlet weak var skippedTimes: UILabel!
    
    @IBOutlet weak var expressionArea: UILabel!
    
    var expression = ""
    var result = ""
    var timer = Timer()
    var timeCountNum = 0
    
    
    var attemptTimesNum = 0
    var skippedTimesNum = 0
    var successCountNum = 0
    
    let Des:Double = 24
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expressionArea.layer.borderWidth = 1
        expressionArea.layer.borderColor = UIColor.black.cgColor
        
        if num1 == 0 && num2 == 0 && num3 == 0 && num4 == 0 {
            generateRandomNumber()
        }
        assignNumber()
        startTimer()
        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        timeCountNum += 1
        let min = Int(timeCountNum/60)
        let sec = timeCountNum - min*60
        if sec < 10 {
            timeCount.text = "\(min):0\(sec)"
        }else{
            timeCount.text = "\(min):\(sec)"
        }
    }
    
    func assignNumber() {
        btnNum1.isEnabled = true
        btnNum2.isEnabled = true
        btnNum3.isEnabled = true
        btnNum4.isEnabled = true
        btnDone.isEnabled = false
        
        btnNum1.setTitle("\(Int(num1))", for: .normal)
        btnNum2.setTitle("\(Int(num2))", for: .normal)
        btnNum3.setTitle("\(Int(num3))", for: .normal)
        btnNum4.setTitle("\(Int(num4))", for: .normal)
        
        expression = ""
        expressionArea.text = expression
        timeCountNum = 0
    }
    func generateRandomNumber() {
        while true {
            num1 = Double(arc4random_uniform(9) + 1)
            num2 = Double(arc4random_uniform(9) + 1)
            num3 = Double(arc4random_uniform(9) + 1)
            num4 = Double(arc4random_uniform(9) + 1)
            
            if getSolution(a: num1, b: num2, c: num3, d: num4).isEmpty == false {
                break
            }
        }
    }
    
    func getSolution(a: Double, b: Double, c: Double, d: Double) -> String {
        var n: [Double] = [a, b, c, d]
        var o: [Character] = ["+", "-", "*", "/"]
        for w in 0...3 {
            for x in 0...3{
                if x == w {
                    continue
                }
                for y in 0...3 {
                    if y == x || y == w {
                        continue
                    }
                    for z in 0...3 {
                        if z == w || z == x || z == y {
                            continue
                        }
                        for i in 0...3 {
                            for j in 0...3 {
                                for k in 0...3 {
                                    let result = eval(a: n[w], b: n[x], c: n[y], d: n[z], x: o[i], y: o[j], z: o[k])
                                    if result.isEmpty == false{
                                        return result
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return ""
    }
    
    func bingo(x: Double) -> Bool {
        
        return abs(x - Des) < 0.0000001
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        print("im in")
        btnDone.isEnabled = true
        let numChose = sender.tag
        switch numChose {
        case 1:
            expression += "\(Int(num1))"
            btnNum1.isEnabled = false
        case 2:
            expression += "\(Int(num2))"
            btnNum2.isEnabled = false
        case 3:
            expression += "\(Int(num3))"
            btnNum3.isEnabled = false
        case 4:
            expression += "\(Int(num4))"
            btnNum4.isEnabled = false
        default:
            expression += ""
        }
        expressionArea.text = expression
    }
    
    
    func eval(a: Double, b: Double, c: Double, d: Double, x: Character, y: Character, z: Character) -> String {
        if bingo(x: eval(num1: eval(num1: eval(num1: a, operater: x, num2: b), operater: y, num2: c), operater: z, num2: d)){
            return "( ( \(Int(a)) \(x) \(Int(b)) ) \(y) \(Int(c)) ) \(z) \(Int(d))"
        }
        if bingo(x: eval(num1: eval(num1: a, operater: x, num2: eval(num1: b, operater: y, num2: c)), operater: z, num2: d)) {
            return "( \(Int(a)) \(x) ( \(Int(b)) \(y) \(Int(c)) ) ) \(z) \(Int(d))"
        }
        if bingo(x: eval(num1: a, operater: x, num2: eval(num1: eval(num1: b, operater: y, num2: c), operater: z, num2: d))) {
            
            return "\(Int(a)) \(x) ( ( \(Int(b)) \(y) \(Int(c)) ) \(z) \(Int(d)) )"
        }
        if bingo(x: eval(num1: a, operater: x, num2: eval(num1: b, operater: y, num2: eval(num1: c, operater: z, num2: d)))) {
            return "\(Int(a)) \(x) ( \(Int(b)) \(y) ( \(Int(c)) \(z) \(Int(d)) ) )"
        }
        if bingo(x: eval(num1: eval(num1: a, operater: x, num2: b), operater: y, num2: eval(num1: c, operater: z, num2: d))) {
            return "( ( \(Int(a)) \(x) \(Int(b)) ) \(y) ( \(Int(c)) \(z) \(Int(d)) ) )"
        }
        
        return ""
    }
    
    func eval(num1: Double, operater: Character, num2: Double) -> Double {
        switch operater {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "*":
            return num1 * num2
        default:
            return num1 / num2
        }
    }
    
    
    

}

