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
        
        
        /* Struct */
        struct Person{
            var name: String;
            
            func sayHello(){
                print("Hello, there! My name is \(name)");
            }
        }
        
        let firstPerson = Person(name: "Xiaomeng");
        print(firstPerson.name);
        firstPerson.sayHello();
        
        struct Car{
            var type: String
            var color: String
            var year: Int
            var topSpeed: Int
            
            func startEngine(){
                print("The \(color) \(year) \(type)'s engine has started.");
            }
            
            func drive(){
                print("The \(color) \(year) \(type) is moving");
            }
            
            func park(){
                print("The \(color) \(year) \(type) is parked");
            }
        }
        
        let firstCar = Car(type: "truck", color: "red", year: 2010, topSpeed: 120);
        let secondCar = Car(type: "sedan", color: "blue", year: 2013, topSpeed: 125);
        
        firstCar.startEngine();
        firstCar.drive();
        
        /* Defining default values prdocue the effect of swift creating memberwise initializer*/
        
        struct Odometer{
            var count: Int = 0;
        }
        let odometer = Odometer()
        print(odometer.count);
        
        /* it is possible to define custom initializer*/
        struct Temperature {
            var celsius: Double
            
            init(celsius: Double){
                self.celsius = celsius;
            }
            
            init(fahrenheit: Double){
                celsius = (fahrenheit - 32)/1.8
            }
            
            init(kelvin: Double){
                celsius = kelvin - 273.15;
            }
            
            init(){
                celsius = 0;
            }
        }
        
        let currentTemperature = Temperature(celsius: 18.5);
        let boilingTemperature = Temperature(fahrenheit: 212.0);
        let absoluteZero = Temperature(kelvin: 0.0);
        let freezingTemperature = Temperature();
        
        print(currentTemperature.celsius);
        print(boilingTemperature.celsius);
        print(absoluteZero.celsius);
        print(freezingTemperature.celsius);
        
        /* It is possible to define methods with returning type, inside Struct*/
        struct Size {
            var width: Double
            var height: Double
            
            func area() -> Double {
                width * height;
            }
        }
        let someSize = Size(width: 10, height: 5.5);
        print(someSize.area());
        
        
        /* In order to mutate properties within a struct
         * a "mutating" method need to be defined
         */
        
        struct MutatingOdometer{
            var count: Int = 0
            
            mutating func increment() {
                count += 1
            }
            
            mutating func increment(by amount: Int){
                count += amount
            }
            
            mutating func reset(){
                count = 0
            }
        }
        
        var secondOdometer = MutatingOdometer()
        secondOdometer.increment();
        print(secondOdometer.count);
        secondOdometer.increment(by: 15);
        print(secondOdometer.count);
        secondOdometer.reset();
        print(secondOdometer.count);
        
        /* To reduce management of multiple properties
         * Swift allows to define computed properties
         * inside a Struct
         * This reduce number of properties to mantain
         * because computed properties will be evaluated
         * each time the property is accessed
         * so the return value will always be up to date
         */
        struct ComputedTemperature{
            var celsius: Double
            
            var fahrenheit: Double {
                celsius * 1.8 + 32
            }
            
            var kelvin: Double {
                celsius + 273.15
            }
        }
        
        var computedTemperature = ComputedTemperature(celsius: 0.0);
        print(computedTemperature.fahrenheit);
        print(computedTemperature.kelvin);
        
        
        /* Swift allows to observe properties
         * and respond to the changes in the property's value
         * the two observers are
         * willSet - called before the "newValue" is set
         * didSet - called after the "newValue" is set, an "oldValue" property is available inside the observer
         */
        struct StepCounter {
            var totalSteps: Int = 0{
                willSet{
                    print("About to set totalSteps to \(newValue)");
                }
                didSet{
                    if totalSteps > oldValue {
                        print("Added \(totalSteps - oldValue) steps");
                    }
                }
            }
        }
        
        var stepCounter = StepCounter();
        stepCounter.totalSteps = 40
        
        /* Swift allows to define property and method related to the type
         * and not to the instance itself
         * Those properties and methods can be defined via the "static" keyword
         * e.g. Double has a static method minimum(Double, Double) that returns the minimum value out of two parameters
         */
        struct StaticTemperature{
            static var boilingPoint = 100;
        }
        
        let boilingPoint = StaticTemperature.boilingPoint;
        print(boilingPoint);
        
        /* Assigning an instance of a Struct to a variable
         * copies the instance and therefor creates a new instance of the struct
         * changin a property to the first instance won't affect the copied instance
         */
        
        var oneSize = Size(width: 250, height: 1000);
        var anotherSize = oneSize;
        
        oneSize.width = 500;
        
        print(oneSize.width);
        print(anotherSize.width);
        
    }


}

