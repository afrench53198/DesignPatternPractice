//: Playground - noun: a place where people can play

import Foundation


// This is a builder design pattern. It simulates "building" code in the description property, which prints to look like code. You can add variables using the "addField(called name:ofType type:)" function. The Builder pattern is good to use on objects that involve a very complicated initialization with many arguments needed. It is an API that allows you to construct complicated objects peice by peice in a succinct manner.

// If the object is extremely complex, you can use multiple builder classes that build different facets of the object. This is the "Faceted Builder" pattern. You can find an example of this pattern by looking in the sources folder for this page.
import Foundation

class CodeBuilder : CustomStringConvertible
{
    var fields = [(String,String)]()
    let rootName: String
    init(_ rootName: String)
    {
        self.rootName = rootName
    }
    
    func addField(called name: String, ofType type: String) -> CodeBuilder
    {
        let field = (name,type)
        fields.append(field)
        return self
    }
    
    public var description: String
    {
        var result = ""
        result += "class \(rootName) \n{ \n"
        if !fields.isEmpty {
            for field in fields {
                result += " " + "var \(field.0): \(field.1)\n"
            }
        }
        result += "}"
        return result
    }
}
let cb = CodeBuilder("name")
cb.addField(called: "first", ofType: "String").addField(called: "last", ofType: "String")

print(cb.description)



