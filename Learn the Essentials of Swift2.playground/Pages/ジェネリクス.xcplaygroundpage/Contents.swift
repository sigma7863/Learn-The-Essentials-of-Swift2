// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # ジェネリクス
 `makeArray`
 */
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)
makeArray(repeating: 100, numberOfTimes: 4) // Item型を定義し、どの型でも渡せる
//: `OptionalValue`
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
//: `anyCommonElements`
// 先ほど「どのような型でも」と書きましたが、渡す型に制約を加えることもできます。
// where を使って継承しているプロトコルや、型を限定することができます。
// 以下は、第一引数と第二引数に同一の要素があるかをチェックする関数です。
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
// <T: Equatable> は <T> ... where T: Equatable と同じで、T が Equatable を継承していることを示します。
//: [Previous](@previous) | [Next](@next)
