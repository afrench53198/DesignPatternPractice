//: [Previous](@previous)

import Foundation
// The Adapter Pattern is when you take an interface "x" and using a class or a common interface "adapt" interface x to interface "y". In this example, square is being adapted to the Rectangle protocol.

class Square
{
    var side = 0
    
    init(side: Int)
    {
        self.side = side
    }
}

protocol Rectangle
{
    var width: Int { get }
    var height: Int { get }
}

extension Rectangle
{
    var area: Int
    {
        return self.width * self.height
    }
}

class SquareToRectangleAdapter : Rectangle
{
    var width: Int
    var height: Int
    
    init(_ square: Square)
    {
        self.width = square.side
        self.height = square.side
    }
    func toSquare(rect: Rectangle) -> Square? {
        if rect.width == rect.height {
            return Square(side: width)
        } else {
            return nil
        }
    }
}
//: [Next](@next)


//: [Next](@next)
