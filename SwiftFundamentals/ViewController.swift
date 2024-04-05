//
//  ViewController.swift
//  SwiftFundamentals
//
//  Created by Francesco Panico on 21/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        
        /* String interpolation */
        let name = "Sophie";
        let age = 30;
        
        print("\(name) is \(age) years old");
        
        /* String size */
        
        print("Size of string \(name) is: \(name.count)");
        
        /* Strings operations */
        
        let greeting: String = "Hello, world!"
        
        print(greeting.hasSuffix("world!"));
        print(greeting.hasSuffix("World!"));
        print(greeting.hasPrefix("Hello"));
        if greeting.contains("lo, wor"){
            print("Greetings")
        }

        let someChar: Character = "e";
        switch someChar{
        case "a", "e", "i":
            print("a e i");
        case "o", "u":
            print("o u");
        default:
            print("consonant");
        }
        
        /*
         Unicode character are treated as single character of length 1
         In reality those unicode character are composed of more (invisble) character
         e.g. "👩🏽‍🎓" is composed of four character!
         */
        let cow = "🐮";
        print("size of \(cow) is \(cow.count)");
        
        
        /* Functions */
        
        /* it is possible to define labels
         * for the function parameter
         * in the example below
         * "to" and "and" are the parameters' label
         * while "person" and "anotherPerson" are the parameters' name
         * Inside the function's body you have to refer parameters with their names
         */
        
        func sayHello(to person: String, and anotherPerson: String){
            print("Hello \(person) and \(anotherPerson)");
        }
        
        sayHello(to: "Trev", and: "Tania");
        
        /* it is possible to omit the argument label
         * with the discard character "_"
         * to specify return type after parameter definition
         * It is possible to assign default values to paramters
         * the following syntax is required
         * -> returnType
         * with Swift 5.1 if the codeblock has only one line it is possible to omit "return" keyword
         */
        
        func add(_ firstNumber: Int, to secondNumber: Int = 0) -> Int {
            firstNumber + secondNumber;
        }
        
        print(add(14, to: 6));
        print(add(13));
    }


}

