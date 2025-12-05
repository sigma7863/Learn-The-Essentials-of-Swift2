// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # クラスと初期化関数
 `Shape` クラス
 */
// クラスはプロパティやメソッドを持つ
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//: `Shape` クラスの初期化をし、メソッドを呼んでみましょう。
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
//: `NamedShape` クラス
class NamedShape {
    var numberOfSides = 0
    var name: String
    
    // Swiftでは、すべてのプロパティはインスタンス化がされるまでに値が代入されていなければならないため、プロパティの宣言時に値を持たないプロパティは、イニシャライザで初期化をする必要がある
    init(name: String) {
        self.name = name // self.name の self は、引数の name と NamedShape のプロパティの name を区別するために使っている
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//: `NamedShape` クラスを初期化しましょう。
let namedShape = NamedShape(name: "my named shape")
//: `Square` クラス
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
    }
}


//: `Circle` クラス



//: `Triangle` クラスと `shapesArray`



/*:
 > `as?` を `as!` にするとどうなるでしょう？
 */

//: [Next](@next)
