import Foundation

 public class School {
    
    public var teachers: Int
    public var students: Int
    public static let demoSchool = School(teachers: 40, students: 400)
  
    init(teachers: Int, students: Int) {
        self.teachers = teachers
        self.students = students
    }
}
let demoSchool = School(teachers: 40, students: 400)

