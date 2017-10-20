//: [Previous](@previous)

import Foundation
// This is the Prototype Design Pattern, Demonstrated with the copy() func in the Point class and the deepCopy() func in the Line class. It works by returning an identical line with a separate reference that used copies of the points in its initialization. This is a useful pattern for testing your code, as it allows you to rapidly create "prototypes to work with"

class Point: CustomStringConvertible
{
    var x = 0
    var y = 0
    
    init() {}
    
    init(x: Int, y: Int)
    {
        self.x = x
        self.y = y
    }
    
    func copy() -> Point {
        return Point(x: self.x, y: self.y)
    }
    var description: String {
        return "\(x,y)"
    }
    
}

class Line: CustomStringConvertible
{
    var start = Point()
    var end = Point()
    
    init(start: Point, end: Point)
    {
        self.start = start
        self.end = end
    }
    
    func deepCopy() -> Line
    {
        return Line(start: start.copy(), end: end.copy())
    }
    
    var description: String {
        return "\(start.description)->\(end.description)"
    }


}
let line = Line(start: Point(), end: Point(x: 2, y: 6))
print("original line \(line)")
let lineCopy = line.deepCopy()
print("copy line \(lineCopy)\n")

line.start.x = 15
print("original line \(line)")
print("copy line \(lineCopy)")

//: [Next](@next)
