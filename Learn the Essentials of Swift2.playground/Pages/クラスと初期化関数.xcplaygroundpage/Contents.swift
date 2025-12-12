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
class Circle: NamedShape {
    var radius: Double
    
    init?(radius: Double, name: String) { // 初期化が失敗したらnilを返す
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
        if radius <= 0 {
            return nil
        }
    }
    
    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)."
    }
}
let successfulCircle = Circle(radius: 4.2, name: "successful circle")
let failedCircle = Circle(radius: -7, name: "failed circle") // nil
//: `Triangle` クラスと `shapesArray`
class Triangle: NamedShape {
    init(sidelLength: Double, name: String) {
        super.init(name: name)
        numberOfSides = 3
    }
}

let shapesArray = [Triangle(sidelLength: 1.5, name: "triangle1"), Triangle(sidelLength: 4.2, name: "triangle2"), Square(sideLength: 3.2, name: "squere1"), Square(sideLength: 2.7, name: "squere2")]
var squares = 0
var triangles = 0
for shape in shapesArray { // Square 型か Triangle 型かの判断をするため、ダウンキャストを試みる, ダウンキャスト: スーパークラスをサブクラスに変換すること
    if let square = shape as? Square { // NamedShape のサブクラスが Square か Triangle であるか判断する
        squares += 1
        print("Square number of sides: \(square.numberOfSides)") // Triangle number of sides 3
    } else if let triangle = shape as? Triangle {
        triangles += 1
        print("Triangle number of sides \(triangle.numberOfSides)") // Triangle number of sides 3
    }
}
print("\(squares) squares and \(triangles) triangles.") // 2 squares and 2 triangles.
//                利点
// アップキャスト    同じスーパークラス、プロトコルを持つオブジェクトをまとめるのに便利
// ダウンキャスト    特定のクラス、構造体でのみ行わせたい処理をするのに便利
/*:
 > `as?` を `as!` にするとどうなるでしょう？
 */
//warning: クラスと初期化関数.xcplaygroundpage:94:27: treating a forced downcast to 'Square' as optional will never produce 'nil'
//    if let square = shape as! Square {
//                          ^
//
//クラスと初期化関数.xcplaygroundpage:94:29: use 'as?' to perform a conditional downcast to 'Square'
//    if let square = shape as! Square {
//                            ^
//                            ?
//
//クラスと初期化関数.xcplaygroundpage:94:21: add parentheses around the cast to silence this warning
//    if let square = shape as! Square {
//                    ^
//                    (               )
//
//error: クラスと初期化関数.xcplaygroundpage:94:8: initializer for conditional binding must have Optional type, not 'Square'
//    if let square = shape as! Square {
//       ^            ~~~~~~~~~~~~~~~~
//: [Next](@next)
//Swift 言語の基礎を学ぼう 2
//
//今回は、前回に引き続き Swift 言語の基礎を学んでいきます。
//
//今回の環境は前回同様に
//
//macOS Big Sur 11.4
//Xcode 12.5.1 (12E507)
//です。
//
//Playground を使い、実際に手を動かしながら学んでいきましょう。
//
//目次
//【実習】Playground の準備
//【実習】Swift 言語の基礎
//クラスとイニシャライザ
//継承
//初期化の失敗
//ダウンキャスト
//列挙型と構造体
//列挙型
//構造体
//プロトコル
//プロトコルを継承する
//ジェネリクス
//Swift と CocoaTouch
//まとめ
//【実習】Playground の準備
//今節で利用する Playground は learn-the-essentials-of-swift2.zip です。
//
//ダウンロードし、 Playground ファイルを開いて準備をしましょう。
//
//【実習】Swift 言語の基礎
//クラスとイニシャライザ
//Swift はオブジェクト指向という考え方を使ったプログラミングができる言語です。
//オブジェクト指向プログラミングでは、オブジェクトの振る舞いを定義することでプログラムの動作を作ることができます。
//オブジェクト指向プログラミングでは、クラスで定義された振る舞いを持つオブジェクトであるインスタンスを作成して利用します。
//
//クラスはオブジェクトの設計図のようなもので、そのオブジェクトが持つべき属性（プロパティ）や振る舞い（メソッド）を定義します。
//そのクラスから生成される具体的なオブジェクトをインスタンスと呼びます。
//インスタンスはクラスで定義されたプロパティとメソッドを持ちます。
//
//これからこのクラスの定義の仕方について説明を行っていきます。
//
//クラスは class で宣言します。
//クラスはプロパティやメソッドを持ちます。
//
//以下を書いて、 Shape クラスを作成しましょう。
//
//class Shape {
//  var numberOfSides = 0
//  func simpleDescription() -> String {
//    return "A shape with \(numberOfSides) sides."
//  }
//}
//Please Type!
//クラスのインスタンス、つまり具体的なオブジェクトを作るにはクラス名の後ろに丸括弧を書きます。
//メソッドやプロパティにはドット記法でアクセスをします。
//
//以下を書いてメソッドを呼び出してみましょう。
//
//var shape = Shape()
//shape.numberOfSides = 7
//var shapeDescription = shape.simpleDescription()
//Please Type!
//さて、ここで Shape クラスにはイニシャライザがないことがわかります。
//イニシャライザとは、インスタンスを作るメソッドのことです。
//他のメソッドと宣言の仕方が違い、 init を使います。
//
//以下を書いて、 NamedShape クラスを作成しましょう。
//
//class NamedShape {
//  var numberOfSides = 0
//  var name: String
//
//  init(name: String) {
//    self.name = name
//  }
//
//  func simpleDescription() -> String {
//    return "A shape with \(numberOfSides) sides."
//  }
//}
//Please Type!
//self.name の self は、引数の name と NamedShape のプロパティの name を区別するために使っています。
//
//self はクラス、構造体、および列挙型の内部でインスタンスを参照するためのキーワードです。
//なお simpleDescription() のように、インスタンスメソッドの内部では、プロパティやメソッドに明示的に self を使わずにアクセスできます。
//
//この場合は以下のようにインスタンスを作ります。
//
//let namedShape = NamedShape(name: "my named shape")
//Please Type!
//継承
//クラスは 継承 することができます。
//
//継承とは、既存クラスの特性を受け継ぐことができるオブジェクト指向言語の特徴的な機能の一つです。
//
//Swift で継承を行うには、クラスを定義する際コロン : に続けて継承元となるクラス名を記述します。
//
//以下を書いて、 NamedShape クラスを継承した Square クラスを作成しましょう。
//
//class Square: NamedShape {
//  var sideLength: Double
//
//  init(sideLength: Double, name: String) {
//    self.sideLength = sideLength
//    super.init(name: name)
//    numberOfSides = 4
//  }
//
//  func area() ->  Double {
//    return sideLength * sideLength
//  }
//
//  override func simpleDescription() -> String {
//    return "A square with sides of length \(sideLength)."
//  }
//}
//let testSquare = Square(sideLength: 5.2, name: "my test square")
//testSquare.area()
//testSquare.simpleDescription()
//Please Type!
//継承をする側のクラスを サブクラス (子クラス)、継承される側のクラスを スーパークラス (親クラス) と言います。
//今回の例でいえば、Square がサブクラス、NamedShape がスーパークラスとなっています。
//
//サブクラスは、スーパークラスのメソッドの実装を上書きできます。
//これをオーバーライドと言い、override キーワードを使用して行います。
//この例では simpleDescription の中身を書き換えています。
//
//Square クラスのイニシャライザは以下のような動作をします。
//
//Square クラスのプロパティを設定する
//スーパークラスである NamedShape のイニシャライザを呼ぶ
//スーパークラスで定義されたプロパティを書き換える
//初期化の失敗
//Swift のイニシャライザは、初期化を失敗させることもできます。
//初期化が失敗したら nil を返す init? というイニシャライザを宣言します。
//
//以下を書いて NamedShape クラスを継承した Circle クラスを作成しましょう。
//
//class Circle: NamedShape {
//  var radius: Double
//
//  init?(radius: Double, name: String) {
//    self.radius = radius
//    super.init(name: name)
//    numberOfSides = 1
//    if radius <= 0 {
//        return nil
//    }
//  }
//
//  override func simpleDescription() -> String {
//    return "A circle with a radius of \(radius)."
//  }
//}
//let successfulCircle = Circle(radius: 4.2, name: "successful circle")
//let failedCircle = Circle(radius: -7, name: "failed circle")
//Please Type!
//successfulCircle は Circle クラスを得られますが、 failedCircle は nil になります。
//
//ダウンキャスト
//スーパークラスをサブクラスに変換することを ダウンキャスト といいます。
//
//ダウンキャストするには as? または as! を使います。
//
//as? はダウンキャストに失敗すると nil を返します。
//as! は強制的にダウンキャストしますが、失敗すると実行時エラーになります。
//なお、オプショナルで as Any について触れましたが、 これはサブクラスをスーパークラスに変換する アップキャスト なので 失敗することはなく、オプショナルにする必要はありませんでした。
//
//以下を書いてダウンキャストを行い、ログ出力を見てみましょう。
//
//class Triangle: NamedShape {
//  init(sideLength: Double, name: String) {
//    super.init(name: name)
//    numberOfSides = 3
//  }
//}
//
//let shapesArray = [Triangle(sideLength: 1.5, name: "triangle1"), Triangle(sideLength: 4.2, name: "triangle2"), Square(sideLength: 3.2, name: "square1"), Square(sideLength: 2.7, name: "square2")]
//var squares = 0
//var triangles = 0
//for shape in shapesArray {
//  if let square = shape as? Square {
//    squares += 1
//    print("Square number of sides: \(square.numberOfSides)")
//  } else if let triangle = shape as? Triangle {
//    triangles += 1
//    print("Triangle number of sides: \(triangle.numberOfSides)")
//  }
//}
//print("\(squares) squares and \(triangles) triangles.")
//Please Type!
//ログには、
//
//Triangle number of sides: 3
//Triangle number of sides: 3
//Square number of sides: 4
//Square number of sides: 4
//2 squares and 2 triangles.
//
//とログ出力されます。
//
//for 文の中にある if 文は、NamedShape のサブクラスが Square であるか Triangle であるかで処理を分岐しています。
//
//ここで、アップキャストとダウンキャストの利点を以下に示します。
//
//利点
//アップキャスト    同じスーパークラス、プロトコルを持つオブジェクトをまとめるのに便利
//ダウンキャスト    特定のクラス、構造体でのみ行わせたい処理をするのに便利
//先ほどの例では、 Triangle と Square を同じ配列にまとめたかったので shapesArray を共通のスーパークラスである NamedShape 型の配列として宣言しました。
//その後の for 文では Square 型か Triangle 型かの判断がしたかったので ダウンキャストを試みて、成功したらそれぞれのカウントを増やすという処理をしました。
//
//このように場面によって適切な型に変換することで処理を進めやすくなります。
