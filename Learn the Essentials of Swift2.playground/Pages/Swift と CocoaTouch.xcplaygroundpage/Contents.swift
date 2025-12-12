// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # Swift と CocoaTouch
 ## Swift Standard Library

 今まで紹介したデータ型は Swift Standard Library に含まれています。
 */
let sampleString: String = "hello"
let sampleArray: Array = [1, 2, 3.1415, 23, 42]
/*:
 > `String` や `Array` を Option+Click して Swift Standard Library の型を読んでみましょう。
 */

/*:
 ## UIKit
 */
import UIKit
let redSquare = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
redSquare.backgroundColor = UIColor.red
//: [Previous](@previous)
// まとめ
// Swift ではクラスを使ったオブジェクト指向プログラミングができる
// クラスと似ている部品に列挙型・構造体・プロトコルがあり、それぞれ特定の目的で使用すると便利
// iOS アプリは、CocoaTouch フレームワークのクラスを活用して開発する

// Swift 言語の基礎を学ぼう 2
//
// 今回は、前回に引き続き Swift 言語の基礎を学んでいきます。
//
// 今回の環境は前回同様に
//
// macOS Big Sur 11.4
// Xcode 12.5.1 (12E507)
// です。
//
// Playground を使い、実際に手を動かしながら学んでいきましょう。
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
//
//列挙型と構造体
//クラス以外にも Swift にはデータ型があります。
//次に、列挙型と構造体について説明をします。
//これらもクラスと同じように使えますが、それぞれ便利になる場面があるので、 実現したいことに合わせて使い分けていくのがよいでしょう。
//
//列挙型
//列挙型は関係のある事柄をまとめて定義するときに使うとよいでしょう。
//以下を書いて列挙型の動作を見てみましょう。
//
//enum Rank: Int {
//  case ace = 1
//  case two, three, four, five, six, seven, eight, nine, ten
//  case jack, queen, king
//  func simpleDescription() -> String {
//    switch self {
//        case .ace:
//            return "ace"
//        case .jack:
//            return "jack"
//        case .queen:
//            return "queen"
//        case .king:
//            return "king"
//        default:
//            return String(self.rawValue)
//    }
//  }
//}
//let ace = Rank.ace
//let aceRawValue = ace.rawValue
//Please Type!
//以上では Rank という名前の列挙型を定義しています。
//この列挙型は Int 型の生の値 (rawValue) を持っています。
//この rawValue は列挙型の各ケースに対応した数値を表しています。
//
//Swift の列挙型では Int 型を使用した場合、そのケースは連番になります。
//case ace = 1 としているので、次にくる two は 2, three は 3 といった具体的な値が自動で割り当てられます。
//case ace = 1 がない場合は 0 から始まります。
//
//次に rawValue を用いてインスタンスを作成する方法について解説します。
//rawValue を指定してインスタンスを作成するには、イニシャライザ init?(rawValue:) を使用します。
//これは Optional 型を返すので、if let などでアンラップする必要があります。
//
//以下を書いてみましょう。
//
//if let convertedRank = Rank(rawValue: 3) {
//  let threeDescription = convertedRank.simpleDescription()
//  print("rank: \(threeDescription)")
//}
//Please Type!
//指定する rawValue を変化させていくと、正しくない場合は if 文の中の処理が実行されなくなります。
//
//rawValue は実際にコード上で意味のあるものにしましょう。
//Rank はトランプの数を表すので Int 型でした。
//
//以下に Suit を定義しますが、これはトランプの柄を表すので型は指定しません。
//柄名を String で取得したい場合は simpleDescription() を呼び出すようにします。
//
//以下を書いて、Suit 列挙型を作成しましょう。
//
//enum Suit {
//  case spades, hearts, diamonds, clubs
//  func simpleDescription() -> String {
//    switch self {
//        case .spades:
//            return "spades"
//        case .hearts:
//            return "hearts"
//        case .diamonds:
//            return "diamonds"
//        case .clubs:
//            return "clubs"
//    }
//  }
//}
//let hearts = Suit.hearts
//let heartsDescription = hearts.simpleDescription()
//Please Type!
//このように、Swift の列挙型は非常に多機能であり、多くの場面で役立ちます。
//関連する値をまとめて扱いたい場合、限定された選択肢を持つ場合などに特に有用です。
//
//構造体
//構造体はクラスと同じような動作をします。
//プロパティを持ち、メソッドも持ちます。
//
//クラスと構造体の大きな違いは、構造体は継承をしないこと、構造体は値型であることです。
//値型であるということは、構造体のインスタンスが他の変数や定数に代入されると、その値自体がコピーされるということです。
//そのため、コピーした後に変数を変更しても、元の変数は影響を受けません。
//
//対照的にクラスは参照型です。
//クラスのインスタンスを他の変数や定数に代入すると、その参照（メモリ上の場所）がコピーされます。
//これにより、複数の変数が同じインスタンスを指すことになるため、1 つの変数でインスタンスを変更すると、他の変数も影響を受けることになります。
//
//Swift で参照とは UnsafeRawPointer で取得できるようなポインタのことです。
//構造体は継承や型変換が必要ないような、軽いデータ型を定義するのに適しています。
//
//以下を書いて、 Rank, Suit 型のプロパティを持つ Card 構造体を作成しましょう。
//
//struct Card {
//  var rank: Rank
//  var suit: Suit
//  func simpleDescription() -> String {
//    return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
//  }
//}
//let threeOfSpades = Card(rank: .three, suit: .spades)
//let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//Please Type!
//初期化時に与える Rank, Suit によって出力が変わるのがわかります。
//
//プロトコル
//プロトコルは、メソッドやプロパティなどの、クラスや構造体、列挙型に必要な部品群を定義するものです。
//定義するだけで実際に具体的な実装を記述するものではありません。
//
//以下を書いて、プロトコルを作成しましょう。
//
//protocol ExampleProtocol {
//  var simpleDescription: String { get }
//  func adjust()
//}
//Please Type!
//クラスや構造体ではプロパティは初期化が必要でしたし、メソッドは中身が必要でした。
//プロトコルはプロパティやメソッドにどのようなものがあるかのみを記述します。
//
//プロパティの後ろにある { get } は、そのプロパティが読み取り専用ということを表しています。
//
//プロトコルを継承する
//実際にプロトコルを使ってみましょう。
//
//プロトコルを継承するには、クラスの継承と同じように型名の後にコロン(:)に続けてプロトコル名を記述します。
//
//以下を書いて、 ExampleProtocol を継承した SimpleClass クラスを作成しましょう。
//
//class SimpleClass: ExampleProtocol {
//  var simpleDescription: String = "A very simple class."
//  var anotherProperty: Int = 69105
//  func adjust() {
//    simpleDescription += "  Now 100% adjusted."
//  }
//}
//var a = SimpleClass()
//a.adjust()
//let aDescription = a.simpleDescription
//Please Type!
//SimpleClass は ExampleProtocol を継承しているので String 型の simpleDescription と、 adjust() 関数を実装しています。
//
//プロトコルは他の型と同じように扱うことができます。
//
//以下を書いて、 ExampleProtocol の配列を作成し出力を見てみましょう。
//
//class SimpleClass2: ExampleProtocol {
//  var simpleDescription: String = "Another very simple class."
//  func adjust() {
//    simpleDescription += "  Adjusted."
//  }
//}
//
//var protocolArray: [ExampleProtocol] = [SimpleClass(), SimpleClass(), SimpleClass2()]
//for instance in protocolArray {
//  instance.adjust()
//  print(instance.simpleDescription)
//}
//Please Type!
//ログには
//
//A very simple class.  Now 100% adjusted.
//A very simple class.  Now 100% adjusted.
//Another very simple class.  Adjusted.
//
//と出力されます。プロトコルを継承した実際のクラスにより simpleDescription の値が異なることが わかります。
//
//なお右側には (3 times) と表示されています。
//これは for ループが 3 回実行されたことを表しています。
//ここにマウスカーソルを合わせると一番右側に四角が現れます。クリックしてみましょう。
//
//右側の四角いアイコン
//Another very simple class. Adjusted. という表示が現れます。
//これは最後に評価された出力を表しています。
//この四角を選択し、 Editor > Result Display Mode > Value History と選択すると 評価された順に出力を表示することもできます。
//
//Editor > Result Display Mode > Value History
//また、この表示を消すにはマウスカーソルを合わせて右側の x ボタンをクリックします。
//
//ジェネリクス
//複数の型に対応できるジェネリクスのイメージ図
//
//Swift にはジェネリクスの機能があります。
//ジェネリクスを使うことで関数を様々な型に対応することができます。
//
//関数でジェネリクスを使うには関数名の後に山括弧 <> で型名を囲います。
//その型名を使って関数の中身を実装していきます。
//
//ジェネリクスに対応した関数はどのような型でも渡すことが可能です。
//以下を書いて実際に試してみましょう。
//
//func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
//  var result = [Item]()
//  for _ in 0..<numberOfTimes {
//    result.append(item)
//  }
//  return result
//}
//makeArray(repeating: "knock", numberOfTimes: 4)
//makeArray(repeating: 100, numberOfTimes: 4)
//Please Type!
//ジェネリクスは関数以外にもクラス、構造体、列挙型でも使えます。
//例えば Optional はジェネリクスを使って実装されています。
//
//enum OptionalValue<Wrapped> {
//  case none
//  case some(Wrapped)
//}
//var possibleInteger: OptionalValue<Int> = .none
//possibleInteger = .some(100)
//Please Type!
//先ほど「どのような型でも」と書きましたが、渡す型に制約を加えることもできます。
//where を使って継承しているプロトコルや、型を限定することができます。
//以下は、第一引数と第二引数に同一の要素があるかをチェックする関数です。
//書いてみましょう。
//
//func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
//  where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
//    for lhsItem in lhs {
//      for rhsItem in rhs {
//        if lhsItem == rhsItem {
//          return true
//        }
//      }
//    }
//    return false
//}
//anyCommonElements([1, 2, 3], [3])
//Please Type!
//<T: Equatable> は <T> ... where T: Equatable と同じで、T が Equatable を継承していることを示します。
//
//Swift と CocoaTouch
//CocoaTouch とは、 iOS アプリを開発するためのフレームワークで、 Apple が開発しています。
//このフレームワークと Swift を使い iOS アプリを開発することになります。
//
//今までに String や Array などを学びましたが、それらは Swift Standard Library にあるデータ型でした。
//
//以下を書いて、 Playground で Swift Standard Library を見てみましょう。
//
//let sampleString: String = "hello"
//let sampleArray: Array = [1, 2, 3.1415, 23, 42]
//Please Type!
//Xcode で型名を ⌥(Option) + Click すると Swift Standard Library の型について知ることができるので、 興味があれば見てみてもよいでしょう。
//
//String 型についてのドキュメント
//CocoaTouch フレームワークの中で最も使うのが、 UIKit です。
//UIKit にはアプリの UI に関する便利なクラスが含まれています。
//
//以下を書いて、 UIKit モジュールをインポートしてみましょう。
//
//import UIKit
//Please Type!
//これだけで、 Swift の文法で UIKit の型やメソッド、プロパティが使えるようになります。
//
//以下を書いて、 UIKit のコンポーネントを使ってみましょう。
//
//let redSquare = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
//redSquare.backgroundColor = UIColor.red
//Please Type!
//UIView は UIKit に含まれるクラスで、簡単なビューを提供します。
//redSquare.backgroundColor = UIColor.red の行にマウスカーソルを合わせ、右端の四角をクリックすると 赤色の四角が表示されます。
//
//UIKit 簡単なビュー
//他にも UIKit には多くのクラスがありますが、それぞれについて詳しくは、実際にそのクラスを使う際に解説していきます。
//
//まとめ
//Swift ではクラスを使ったオブジェクト指向プログラミングができる
//クラスと似ている部品に列挙型・構造体・プロトコルがあり、それぞれ特定の目的で使用すると便利
//iOS アプリは、CocoaTouch フレームワークのクラスを活用して開発する
//挑戦
//初級
//Dog クラスを実装してみましょう。
//Dog クラスには名前を表す　name プロパティと、鳴き声を出力する bark() 関数があります。
//
//中級
//name プロパティと鳴き声を出力する bark() 関数をもつ Dog クラスと Cat クラスを実装してみましょう。
//また、 Dog クラスのインスタンスと Cat クラスのインスタンスを要素にもつ animals 配列を作成しましょう。
//
//ヒント: Animal プロトコルを以下のように宣言し、 Cat クラスと Dog クラスはどちらもこれを継承するようにします。
//
//protocol Animal {
//  var name: String { get }
//  func bark() -> String
//}
//Please Type!
//上級
//列挙型を用いて、 name プロパティと鳴き声を出力する bark() 関数をもつ Dog 型と Cat 型を実装してみましょう。
//また、Dog 型のインスタンスと Cat 型のインスタンスを要素にもつ animals 配列を作成しましょう。
//
//ヒント：列挙型にプロパティを設定するには Associated Values の機能を利用します。
//
//挑戦の解答例
//答えを隠す
//
//初級
//class Dog {
//  let name: String
//  func bark() -> String {
//    return "bow wow"
//  }
//
//  init(name: String) {
//    self.name = name
//  }
//}
//Please Type!
//中級
//Dog と Cat で共通化ができるので、プロトコルを作成します。
//今回は Animal という名前にします。
//
//protocol Animal {
//  var name: String { get }
//  func bark() -> String
//}
//
//// Dog クラスは以下のように変化します。
//class Dog: Animal {
//  let name: String
//  func bark() -> String {
//    return "bow wow"
//  }
//
//  init(name: String) {
//    self.name = name
//  }
//}
//
//// Cat クラスも同じように実装します。
//class Cat: Animal {
//  let name: String
//  func bark() -> String {
//    return "meow"
//  }
//
//  init(name: String) {
//    self.name = name
//  }
//}
//
//// [Animals] の配列を作成し、 Dog, Cat インスタンスを格納します。
//let pochi = Dog(name: "Pochi")
//let tama = Cat(name: "Tama")
//let animals: [Animal] = [pochi, tama]
//
//// プロトコルにすることで共通でもつプロトコル・メソッドを呼び出すことができます
//for animal in animals {
//  print("\(animal.name): \(animal.bark())")
//}
//Please Type!
//上級
//enum Animal {
//  case dog(name: String), cat(name: String)
//
//  func bark() -> String {
//    switch self {
//    case .dog(_):
//      return "bow wow"
//    case .cat(_):
//      return "meow"
//    }
//  }
//}
//
//let pochi = Animal.dog(name: "Pochi")
//let tama = Animal.cat(name: "Tama")
//
//let animals = [pochi, tama]
//
//for animal in animals {
//  let _name: String
//  switch animal {
//  case let .dog(name):
//    _name = name
//  case let .cat(name):
//    _name = name
//  }
//  print("\(_name): \(animal.bark())")
//}
