//
//  String_Extensions.swift
//  TempXpertsApp
//
//  Created by Sriram S on 04/03/22.
//

import Foundation


extension String {
    var length: Int {
        return self.count
    }
    
    
  }


extension String {
    func URLEncodedString() -> String? {
        let customAllowedSet =  CharacterSet.urlQueryAllowed
        let escapedString = self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)
        return escapedString
    }

}


extension String {
    func sliceFrom(_ start: String, to: String) -> String? {
        return (range(of: start)?.upperBound).flatMap { sInd in
            (range(of: to, range: sInd..<endIndex)?.lowerBound).map { eInd in
                substring(with: sInd..<eInd)
            }
        }
    }

    func localizedString() -> String {
        var result = String(format: NSLocalizedString(self, comment: ""))
        if GlobalData.languageCode != "en"{
            result = String(format: NSLocalizedString("\(GlobalData.languageCode)_" + self, comment: ""))
        }
        if result.contains("\(GlobalData.languageCode)_"){
            return self
        }
        return result
    }

    func arrayFromStringSeparatedByComma(_ string: String) -> [String] {
        return string.components(separatedBy: "\u{002C}")
    }
    func arrayFromStringSeparatedBySpace(_ string: String) -> [String] {
        return string.components(separatedBy: "\u{003B}")
    }
    
    
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = self.index(startIndex, offsetBy: r.lowerBound)
        let end = self.index(start, offsetBy: r.upperBound - r.lowerBound)
        return String(self[start ..< end])
    }
    
    func isValidEmail() -> Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }
    

}

extension Double {
    func shortTextAmerican() -> String {
        if self < 1000 {
            return "\(self)"
        } else if self >= 1000 && self < 1000000 {
            if Int(self)%1000 <= 50 || Int(self)%1000 >= 950 {
                // this prevents makes 30.0k into 30k
                return "\(String(format: "%0.0f", self/Double(1000)))" + "k"
            }
            return "\(String(format: "%0.1f", self/Double(1000)))" + "k"
        } else if self >= 1000000 && self < 1000000000 {
            if Int(self)%1000000 <= 50000 || Int(self)%1000000 >= 950000 {
                return "\(String(format: "%0.0f", self/Double(1000000)))" + "M"
            }
            return "\(String(format: "%0.1f", self/Double(1000000)))" + "M"
        } else {
            if Int(self)%1000000000 <= 50000000 || Int(self)%1000000000 >= 950000000 {
                return "\(String(format: "%0.0f", self/Double(1000000000)))" + "B"
            }
            return "\(String(format: "%0.1f", self/Double(1000000000)))" + "B"
        }
    }
    func shortTextIndian() -> String {
        if self < 1000 {
            return "\(self)"
        } else if self >= 1000 && self < 100000 {
            if Int(self)%1000 <= 50 || Int(self)%1000 >= 950 {
                // this prevents makes 30.0k into 30k
                return "\(String(format: "%0.0f", self/Double(1000)))" + "k"
            }
            return "\(String(format: "%0.1f", self/Double(1000)))" + "k"
        } else if self >= 100000 && self < 10000000 {
            if Int(self)%100000 <= 5000 || Int(self)%100000 >= 95000 {
                return "\(String(format: "%0.0f", self/Double(100000)))" + "L"
            }
            return "\(String(format: "%0.1f", self/Double(100000)))" + "L"
        } else {
            if Int(self)%10000000 <= 500000 || Int(self)%10000000 >= 9500000 {
                return "\(String(format: "%0.0f", self/Double(10000000)))" + "Cr"
            }
            return "\(String(format: "%0.1f", self/Double(10000000)))" + "Cr"
        }
    }
}

func DLog<T>(_ string: T) {
    #if DEBUG
    print(string)
    #else
    print("NOT IN DEBUG")
    #endif
}

func DLog<T>(_ string: String, _ data: T) {
    #if DEBUG
    print("\n" + string + "\n")
    print(data)
    #else
    print("NOT IN DEBUG")
    #endif
}



extension String {

    
    
    func URLEncodedString1() -> String? {
        let customAllowedSet =  CharacterSet.URLQueryParameterAllowedCharacterSet()
        let escapedString = self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)
        return escapedString
    }
    static func queryStringFromParameters(_ parameters: Dictionary<String,String>) -> String? {
        if (parameters.count == 0)
        {
            return nil
        }
        var queryString : String? = nil
        for (key, value) in parameters {
            if let encodedKey = key.URLEncodedString() {
                if let encodedValue = value.URLEncodedString() {
                    if queryString == nil
                    {
                        queryString = "?"
                    }
                    else
                    {
                        queryString! += "&"
                    }
                    queryString! += encodedKey + "=" + encodedValue
                }
            }
        }
        return queryString
    }
    
    func URLEncodedStringWithReplacableSet() -> String? {
        let customAllowedSet =  CharacterSet(charactersIn:"\"#+<>?@\\^`{|}[]").inverted
        let escapedString = self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)
        return escapedString
    }
    func decodeUrl() -> String
    {
        if (self as NSString).removingPercentEncoding != nil {
            return (self as NSString).removingPercentEncoding!
        }else{
            return self as String
        }
    }

}
