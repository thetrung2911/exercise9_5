//
//  2.2.swift
//  TrungLe
//
//  Created by Trung Le on 5/8/19.
//  Copyright © 2019 Trung Le. All rights reserved.
//

import Foundation

public extension Int {
    func plainEnglish (_ negativeSign: String = "negative") -> String {
        func singleNumberName (_ number: Int) -> String {
            switch (number) {
            case 1: return "một"
            case 2: return "hai"
            case 3: return "ba"
            case 4: return "bốn"
            case 5: return "năm"
            case 6: return "sáu"
            case 7: return "bảy"
            case 8: return "tám"
            case 9: return "chín"
            default:return ""
            }
        }
        
        func tensNumberName (_ number: Int) -> String {
            switch (number) {
            case 2: return "hai mươi"
            case 3: return "ba mươi"
            case 4: return "bốn mươi"
            case 5: return "năm mươi"
            case 6: return "sáu mươi"
            case 7: return "bảy mươi"
            case 8: return "tám mươi"
            case 9: return "chín mươi"
            default:return ""
            }
        }
        
        func teensNumberName (_ number: Int) -> String {
            switch (number) {
            case 0: return "mười"
            case 1: return "mười một"
            case 2: return "mười hai"
            case 3: return "mười ba"
            case 5: return "mười lăm"
            default:return singleNumberName(number) + ""
            }
        }
        
        func bigNumberName (place: Int) -> String? {
            switch (place) {
            case 4: return "nghìn"
            case 7: return "triệu"
            case 10:return "tỷ"
            case 13:return "nghìn"
            case 16:return "triệu"
            case 19:return "tỷ"
            default:return nil
            }
        }
        
        var number = self
        var digits: [Int] = []
        
        while number != 0 {
            digits.append(abs(number%10))
            number /= 10
        }
        
        var plainVnd: [String] = []
        
        var isTeen = false
        let totalPlaces = digits.count
        var currentPlace = 0
        
        for (index, digit) in digits.reversed().enumerated() {
            currentPlace = totalPlaces - index
            if currentPlace % 3 == 0 && digit > 0 {
                plainVnd.append(singleNumberName(digit) + " trăm")
            } else if (currentPlace + 1) % 3 == 0 {
                if digit == 1 {
                    isTeen = true
                    continue;
                } else {
                    isTeen = false
                    plainVnd.append(tensNumberName(digit))
                }
            } else {
                if isTeen {
                    plainVnd.append(teensNumberName(digit))
                } else {
                    plainVnd.append(singleNumberName(digit))
                }
            }
            print(currentPlace)
            
            
            if let bigName = bigNumberName(place: currentPlace) {
                plainVnd.append(bigName)
            }
            
            
        }
        
        let initial = (self < 0) ? negativeSign : ""
        
        func combine (first: String, second: String) -> String {
            let joiner = (first.utf16.count > 0 && second.utf16.count > 0) ? " " : ""
            return first + joiner + second
        }
        
        let finalString = plainVnd.reduce(initial, combine)
        
        return finalString
    }
}
func bai2(){
    print("Nhập số tiền bạn cần đổi:")
    let payamount = Int(readLine()!)!
    let checkString = payamount.plainEnglish() + " đồng"
    print(checkString)
}
