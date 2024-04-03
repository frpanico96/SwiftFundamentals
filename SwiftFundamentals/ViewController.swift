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
        
    }


}

