// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # プロトコル
 `ExampleProtocol`
 */

protocol ExampleProtocol {
    var simpleDescription: String { get }
    func adjust()
}

/*:
 ## プロトコルを継承する
 `SimpleClass`
 */

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

//: `SimpleClass2` と　`ExampleProtocol` の配列

class SimpleClass2: ExampleProtocol {
    var simpleDescription: String = "Another very simple class."
    func adjust() {
        simpleDescription += "  Adjusted."
    }
}

var protocolArray: [ExampleProtocol] = [SimpleClass(), SimpleClass(), SimpleClass2()]
for instance in protocolArray {
    instance.adjust()
    print(instance.simpleDescription)
}

//: [Previous](@previous) | [Next](@next)
