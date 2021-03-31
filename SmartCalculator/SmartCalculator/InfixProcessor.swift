//
//  InfixProcessor.swift
//  TestProcessor
//
//  Created by Mausum Nandy on 19/1/21.
//

import Foundation
class InfixProcessor{
    private let format =  "%.2f"
    var displayStr : String = ""
    var isComplete:Bool = true
    var dotFlag:Bool = true
    
    init(initStr : String) {
        self.displayStr = initStr
    }
    
    func process(nextAction:Character){
        switch nextAction {
            case "1":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case "2":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case "3":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case "4":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case "5":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case "6":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case "7":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case "8":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case "9":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case "0":
                if (nextAction == "0" && displayStr.count < 1){
                    break
                }
                displayStr.append(nextAction)
                break
            case ".":
                if dotFlag{
                    displayStr.append(nextAction)
                }
                dotFlag = false
                break
            case "R":
                reset()
            case "<":
                if displayStr.count > 0{
                    displayStr = String(displayStr.dropLast(1))
                }
                break
            case "%":
                if displayStr.contains("*") || displayStr.contains("/"){
                    dotFlag = true
                    evaluate(nextAction: nextAction)
                }
                break
            default:
                dotFlag = true
                let len = displayStr.count
                var arr : [Character] = Array(displayStr)
                if len < 1 || arr.last == "."{
                    break
                }
                
                print(arr[len - 1].ascii!)

                if arr[len - 1].ascii! < 48{
                    arr[len-1] = nextAction
                    displayStr = String(arr)
                    if nextAction == "="{
                        displayStr = String(displayStr.dropLast())
                    }
                }else if (isComplete){
                    if nextAction != "="{
                        displayStr.append(nextAction)
                    }
                }else{
                    evaluate(nextAction: nextAction)
                }
                break
                
        }
        validate()
    }
    
    //    private func handleDigit(digit: Character){
    //        if (digit == "0" && displayStr.count < 1){
    //            return
    //        }else{
    //            displayStr.append(digit)
    //        }
    //
    //    }
    
    private func evaluate(nextAction: Character){
        var nextAction = nextAction
        var operandStack : [Double] = []
        var operatorStack : [Character] = []
        var numberStr : String = ""
        let arr : [Character] = Array(displayStr)
        
        for ch in arr{
            if ch.ascii! > 47 {
                numberStr.append(ch)
            }else if ch == "."{
                numberStr.append(ch)
            }else{
                operatorStack.append(ch)
                let str = (Double(numberStr)!).removeZerosFromEnd()
                operandStack.append(Double(str)!)
                numberStr = ""
            }
        }
        if numberStr.count > 0{
            operandStack.append(Double(numberStr) ?? 0.0)
        }
        var prevOp : Character = operatorStack.last ?? "0"
        operatorStack = Array(operatorStack.dropLast(1))
        if ((nextAction == "*" || nextAction == "/") && (prevOp == "+" || prevOp == "-")){
            displayStr.append(nextAction)
            return
        }
        var op1 = operandStack.last
        operandStack = Array(operandStack.dropLast(1))
        var op2 = operandStack.last
        operandStack = Array(operandStack.dropLast(1))
        var res = 0.0
        
        if nextAction == "*" || nextAction == "/"{
            switch prevOp {
                case "+":
                    break
                case "-":
                    break
                case "*":
                    if let opn1 = op1, let opn2 = op2{
                        res = opn1 * opn2
                    }
                    
                case "/":
                    if let opn1 = op1, let opn2 = op2{
                        res = opn1 > 0.000001 ? opn2/opn1 : opn2
                    }
                default:
                    return
            }
        }else{
            while (true) {
                switch prevOp {
                    case "+":
                        if let opn1 = op1, let opn2 = op2{
                            res = opn1 + opn2
                        }
                    case "-":
                        if let opn1 = op1, let opn2 = op2{
                            res =  opn1 > opn2 ? opn1 - opn2 : opn2-opn1
                        }
                    case "*":
                        if let opn1 = op1, let opn2 = op2{
                            res = nextAction == "%" ? opn1 * opn2 / 100.0 : opn1 * opn2
                        }
                    case "/":
                        if let opn1 = op1, let opn2 = op2{
                            res = opn1 > 0.000001 ? nextAction == "%" ? opn1 * opn2 / 100.0 : opn2 / opn1 : opn2
                        }
                    default:
                        break
                }
                if operatorStack.isEmpty || operandStack.isEmpty{
                    break
                }
                op2 = res
                op1 = operandStack.last
                operandStack = Array(operandStack.dropLast(1))
                prevOp = operatorStack.last ?? "0"
                operatorStack = Array(operatorStack.dropLast(1))
                if nextAction == "%"{
                    nextAction = "="
                }
            }
        }
        let resStr = String(format: format, res)
        if (res > 0.00001){
            displayStr = resStr + ""
            if (nextAction != "%" && nextAction != "=") {
                displayStr.append(nextAction)
            }
            if (!operandStack.isEmpty && !operatorStack.isEmpty) {
                
                displayStr = String(operandStack.last!) + "" + String(operatorStack.last!) + displayStr
                operandStack = Array(operandStack.dropLast(1))
                operatorStack = Array(operatorStack.dropLast(1))
            }
        }else{
            reset()
        }
    }
    
    func validate(){
        if displayStr.count < 1{
            isComplete = false
            return
        }
        let arr : [Character] = Array(displayStr)
        if (arr[arr.count - 1] == ".") {
            isComplete = false;
            return;
        }
        for ch in arr{
            if (ch == "+" || ch == "-" || ch == "*" || ch == "/" || ch == "=") {
                isComplete = false;
                return;
            }
        }
        isComplete = true
    }
    
    private func  reset() {
        displayStr = "";
        isComplete = false;
        dotFlag = true;
    }
}

extension Character {
    var isAscii: Bool {
        return unicodeScalars.allSatisfy { $0.isASCII }
    }
    var ascii: UInt32? {
        return isAscii ? unicodeScalars.first?.value : nil
    }
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
