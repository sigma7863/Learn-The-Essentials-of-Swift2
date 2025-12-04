// Copyright© DWANGO Co.,Ltd. All Rights Reserved.
/*:
 # クラスと初期化関数
 `Shape` クラス
 */

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

    init(name: String) {
        self.name = name
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
        super.init(name: name)
        numberOfSides = 4
    }

    func area() ->  Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let testSquare = Square(sideLength: 5.2, name: "my test square")
testSquare.area()
testSquare.simpleDescription()

//: `Circle` クラス

class Circle: NamedShape {
    var radius: Double

    init?(radius: Double, name: String) {
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
let failedCircle = Circle(radius: -7, name: "failed circle")

//: `Triangle` クラスと `shapesArray`

class Triangle: NamedShape {
    init(sideLength: Double, name: String) {
        super.init(name: name)
        numberOfSides = 3
    }
}

let shapesArray = [Triangle(sideLength: 1.5, name: "triangle1"), Triangle(sideLength: 4.2, name: "triangle2"), Square(sideLength: 3.2, name: "square1"), Square(sideLength: 2.7, name: "square2")]
var squares = 0
var triangles = 0
for shape in shapesArray {
    if let square = shape as? Square {
        squares += 1
        print("Square number of sides: \(square.numberOfSides)")
    } else if let triangle = shape as? Triangle {
        triangles += 1
        print("Triangle number of sides: \(triangle.numberOfSides)")
    }
}
print("\(squares) squares and \(triangles) triangles.")

/*:
 > `as?` を `as!` にするとどうなるでしょう？
 */

//: [Next](@next)
