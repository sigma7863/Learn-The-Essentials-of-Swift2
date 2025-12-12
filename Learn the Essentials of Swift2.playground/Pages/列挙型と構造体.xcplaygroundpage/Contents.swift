// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # 列挙型と構造体
 ## 列挙型
 `Rank`
 */
// 列挙型の定義
enum Rank: Int { // Int型
    case ace = 1 // 1番目のケース(case ace = 1がない場合は0から始まる)
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
let ace = Rank.ace // ace
let aceRawValue = ace.rawValue // 1

print(ace) // ace
print(aceRawValue) // 1
//: `rawValue` を指定した初期化
// rawValue を指定してインスタンスを作成するには、イニシャライザ init?(rawValue:) を使用する
// Optional 型を返すので、if let などでアンラップする必要がある
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print("rank: \(threeDescription)") // rank: 3
}
//: `Suit`
enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

print(hearts) // hearts(case名がそのまま表示される)
print(heartsDescription) // hearts

// Swift の列挙型は非常に多機能であり、多くの場面で役立ち、関連する値をまとめて扱いたい場合や、限定された選択肢を持つ場合などに特に使える
/*:
 ## 構造体
 `Card`
 */
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

print(threeOfSpades)
print(threeOfSpadesDescription)
//: [Previous](@previous) | [Next](@next)
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
