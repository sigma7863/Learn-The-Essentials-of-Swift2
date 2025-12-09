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
// 継承
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let testSquare = Square(sideLength: 5.2, name: "my test square")
testSquare.area()
testSquare.simpleDescription()
// 継承をする側のクラスを サブクラス (子クラス)、継承される側のクラスを スーパークラス (親クラス) と言う
// 今回の例でいえば、Square がサブクラス、NamedShape がスーパークラスとなる
// overrride(オーバーライド) - サブクラスはスーパークラスのメソッドの実装を上書きできる
// この例では simpleDescription の中身を書き換えている
// Square クラスのイニシャライザは以下のような動作をします。
// 1. Square クラスのプロパティを設定する
// 2. スーパークラスである NamedShape のイニシャライザを呼ぶ
// 3. スーパークラスで定義されたプロパティを書き換える
//: `Circle` クラス
class Square


//: `Triangle` クラスと `shapesArray`



/*:
 > `as?` を `as!` にするとどうなるでしょう？
 */

//: [Next](@next)
