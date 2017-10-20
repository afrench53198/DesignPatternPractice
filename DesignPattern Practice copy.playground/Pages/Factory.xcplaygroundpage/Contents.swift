//: [Previous](@previous)

import Foundation
// The Person Factory below is a good example of the factory design pattern. It has a method createPerson(name:,withId:) that returns an initialized person. The reason PersonFactory is a separate class instead of being a Factory Method is that the ID of the person shouldn't be decided by the person object (Single Responsibility Principle). The Factory pattern is much like the builder pattern in that it creates complex objects, but in the Factory pattern the construction is done all at once instead of the peicewise construction of the builder.

class Person
{
    var id: Int
    var name: String
    
    init(called name: String, withId id: Int)
    {
        self.name = name
        self.id = id
    }

    
    // Factory Method
    // Thie commented static function below displays the Factory Method pattern, where an object has a static func that's purpose is to return an instance of the object
    
    // static func createPerson(name:String, id: Int) -> Person {
//        return Person(called: name, withId: id)
//    }


}

class PersonFactory
{
    var peopleCreated = 0
    
    func createPerson(name: String) -> Person
    {
        let person = Person(called: name, withId: peopleCreated)
        peopleCreated += 1
        return person
    }
}





//: [Next](@next)
