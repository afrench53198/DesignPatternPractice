//: [Previous](@previous)

import Foundation

//The Singleton Pattern consists of a single instance of a class that's used throughout a program. This pattern is useful when you want only one type of component in your system, without it being initialized twice, maybe because the initializer is expensive to call. It is good to stay prudent on when to use the singleton pattern because overuse will lead to many code smells. You can mitigate the negative effects of the singleton pattern by using dependency injection.


// The following example is the common way to do the singleton pattern. It is difficult to test and results in tight coupling. In comments throughout this example, I will show the injection of an abstraction of the SingletonSchoolDatabase into the SchoolRecordKeeper.


//This is the protocol I will use to enable dependency injection.
protocol SchoolDatabase {
    
    func studentToTeacherRatio() -> Int
    
}

class SingletonSchoolDatabase: SchoolDatabase {
    
    static let instance = SingletonSchoolDatabase()
    
    var students: Int!
    var teachers: Int!
    
    private init() {
        self.students = School.demoSchool.students
        self.teachers = School.demoSchool.teachers
    }

    func studentToTeacherRatio() -> Int {
       
        return self.students/self.teachers
    }
}

// This is the database that will be injected into the new RecordKeeper. Think of it in implementation where you wouldn't want to test the actual singleton instance. The ability to do testing with dummies using dependency injection makes testing singletons much easier.
class TestDatabase: SchoolDatabase {
    
    func studentToTeacherRatio() -> Int {
        return 5
    }
}
class ConfigurableSchoolRecordKeeper {
    
    var database: SchoolDatabase
    
    init(database: SchoolDatabase) {
        self.database = database
    }
    // Now this function isn't referring to the singleton but any object implementing the database protocol you initialize the RecordKeeper with
    func analyzeRatio() {
        let ratioStatement = "the student to teacher ratio is \(self.database.studentToTeacherRatio()) students to 1 teacher"
        print(ratioStatement)
    }
    
}



class SchoolRecordKeeper {
    
    var database = SingletonSchoolDatabase.instance
    init() {}
    
    func analyzeRatio() {
        let ratioStatement = "the student to teacher ratio is \(self.database.studentToTeacherRatio()) students to 1 teacher"
        print(ratioStatement)
    }
}



// Testing to see if the instances are the same
let instance = SingletonSchoolDatabase.instance
let instance2 = SingletonSchoolDatabase.instance
let instances = (instance,instance2)

SingletonTester.isSingleton(objects:instances)



//: [Next](@next)
