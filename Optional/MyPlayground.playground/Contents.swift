import UIKit

var str = "Hello, Optional"

func display(_ value: Any) {
    print("value is - \(value)")
}
let noneValue = "EMPTY"

var x: Int? = 1
x = nil

print(x ~= nil)
print(x ~= 1)

if x == 1 {
    print(x)
}
x = 1
print(x.unsafelyUnwrapped)
x = nil

func whatIsOptional(_ value: Optional<Any>) {
    switch value {
    case .some(let v):
        display(v)
    case .none:
        display(noneValue)
    }
    
    switch value {
    case .some(let v):
        display(v)
    case nil:
        display(noneValue)
    }
    
    switch value {
    case let z:
        display(z)
    case .none:
        display(noneValue)
    case .some(let y):
        display(y)
    }
}


whatIsOptional(x)
x = 2
whatIsOptional(x)
// add downcasting here
// add compactMap example
