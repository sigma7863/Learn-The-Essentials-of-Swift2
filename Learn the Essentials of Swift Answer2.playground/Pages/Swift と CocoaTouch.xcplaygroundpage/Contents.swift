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
