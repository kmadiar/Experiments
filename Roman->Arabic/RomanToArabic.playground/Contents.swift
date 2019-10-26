import Foundation

enum Roman: Int, CaseIterable {
    case i = 1
    case iv = 4
    case v = 5
    case ix = 9
    case x = 10
    case xl = 40
    case l = 50
    case xc = 90
    case c = 100
    case cd = 400
    case d = 500
    case cm = 900
    case m = 1000
    
    func toString() -> String {
        switch self {
        case .i:
            return "I"
        case .iv:
            return "IV"
        case .v:
            return "V"
        case .x:
            return "X"
        case .xl:
            return "XL"
        case .l:
            return "L"
        case .ix:
            return "IX"
        case .xc:
            return "XC"
        case .c:
            return "C"
        case .cd:
            return "CD"
        case .d:
            return "D"
        case .cm:
            return "CM"
        case .m:
            return "M"
        }
    }
}

func convert(_ digit: Int) -> String {
    if digit <= 0 {
        return ""
    }
    
    var cases = Roman.allCases.map({ $0.rawValue }).sorted(by: { $0 > $1 })
    var divider = cases.removeFirst()
    
    var resultArray: [String] = []
    var digit2 = digit
    while (divider > 0 && digit2 > 0) {
        let element =  digit2 / divider
        if element > 0 {
            digit2 -= divider
            resultArray.append(Roman(rawValue: divider)!.toString())
        } else {
            if cases.count > 0 {
                divider = cases.removeFirst()
            } else {
                divider = 0
            }
        }
    }
    
    return resultArray.reduce("", +)
}

print(convert(2421))
print(convert(789))
print(convert(246))
print(convert(39))
