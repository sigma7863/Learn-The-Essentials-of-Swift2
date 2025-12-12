// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # プロトコル
 `ExampleProtocol`
 */
// プロトコル: メソッドやプロパティなどの、クラスや構造体、列挙型に必要な部品群を定義するもの
// 定義するだけで実際に具体的な実装を記述するものではない
protocol ExampleProtocol {
    var simpleDescription: String { get } // { get }: 読み取り専用
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
let  aDescription = a.simpleDescription
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

// A very simple class.  Now 100% adjusted.
// A very simple class.  Now 100% adjusted.
// Another very simple class.  Adjusted.
//: [Previous](@previous) | [Next](@next)
