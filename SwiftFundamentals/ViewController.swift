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
        
        //==========
        // STRINGS
        //==========
        
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
        
        //==========
        // FUNCTIONS
        //==========
        
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
        
        
        //==========
        //STRUCTURES
        //==========
        
        
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
        
        
        //==========
        // CLASSES
        //==========
        
        /*
         * Classes are very similar to structures
        */
        
        class PersonClass{
            let name: String
            var age: Int
            
            init(name: String, age: Int){
                self.name = name;
                self.age = age;
            }
            
            func sayHello(){
                print("Hello there!")
            }
        }
        
        print("Classes:")
        let personClass = PersonClass(name: "Jenny", age: 29);
        personClass.sayHello();
        
        /*
         * The main difference is that classes have inheritance
         * They can have parent and child classes
         * Parent class is called superclass
         * Child class is calles subclass
         * A class that does not inherit from a superclass is known as base class
         */
        
        class Vehicle{
            var currentSpeed = 0.0;
            
            var description: String {
                "travelling at \(currentSpeed) miles per hour";
            }
            
            func makeNoise(){}
            
        }
        
        /*
         * Veichle is the base class
         * we now create a subclass that inherits from Veichle class.
         * The subclass Bycicle has all the properties and methods of Veichle
         * In addition it has its own properties i.e. hasBasket.
         */
        
        class Bicycle: Vehicle{
            var hasBasket = false;
        }
        
        let bycicle = Bicycle();
        print(bycicle.description);
        
        /*
         * It is possible to create a subclass that inherits from subclass
         */
        
        class Tandem: Bicycle{
            var currentNumberOfPassengers = 0;
        }
        
        /*
         * Subclasses can override methods and computed variables from thew superclass
         */
        
        class Train: Vehicle{
            
            var gear = 1;
            
            override var description: String{
                super.description + " in gear \(gear)";
            }
            
            override func makeNoise() {
                print("Choo Choo");
            }
        }
        
        let train = Train();
        train.makeNoise();
        print(train.description);
        
        /* It is possible to ovveride initializer in a subclass*/
        class Student: PersonClass{
            var favoriteSubject: String
            
            init(name: String, age:Int, favoriteSubject: String){
                self.favoriteSubject = favoriteSubject;
                super.init(name: name, age: age);
            }
        }
        
        /*
         * A special feature of classes is their ability to reference values assigned to a constant or variable.
         * Constants or variables do not contain the values itself, they point to the value in memory
         * When you assign a class to multiple variables, each variable will reference, or point to,
         * the same address in memory. So if you update one of the variables, both variables will be updated
         */
        
        var jay = PersonClass(name: "Jay", age: 24);
        var myFriend = jay;
        
        jay.age += 1;
        
        print(jay.age);
        print(myFriend.age);
        
        /*
         * Unlike structures, Swift does not create a memberwise initializer for classes.
         * A basic rule is to start new type as structures until you need one of the features that classes provide
         * Otherwise, frameworks like Foundation or UIKit works with classes
         * It is common practice to create child classes of framework base class e.g. UIView.
         */
        
        //==========
        // COLLECTIONS
        //==========

        /* Swift defines two types of collection: arrays and dictionaries */
        
        /* Arrays */
        
        /* var names: [String] = ["Andre", "Aileen", "Anthony"]; */
        var numbers: [Int8] = [1, -3, 50, 72, -95, 115];
        
        if numbers.contains(5){
            print("There is 5");
        }
        
        /*
         * defining arrays
         
         var myArray: [Int] = [];
         var myArray2: Array<Int> = [];
         var myArray3 = [Int]();
        */
        
        var myArray = [Int](repeating: 0, count: 100);
        let count = myArray.count;
        if myArray.isEmpty{
            print("Empty array");
        }
        
        var names = ["Amy"];
        names.append("Joe");
        names += ["Anthony", "James"];
        print(names);
        names.insert("Bob", at: 0);
        names.remove(at: 2);
        names.removeLast();
        print(names);
        names.removeAll();
        print(names);
        
        var myArray2 = [Int](repeating: 1, count: 100);
        var myArray3 = myArray + myArray2;
        
        var myArray4 = [1,2,3];
        var myArray5 = [4,5,6];
        let containerArray = [myArray4, myArray5];
        print(containerArray[0])
        print(containerArray[0][0])
        
        
        /* Dictionaries */
        
        var scores = ["Richard": 500, "Luke": 400, "Cheryl": 800];
        
        /*
         defining dictionaries
         
         myDictionary = [String: Int]();
         myDictionary = Dictionary<String, Int>();
         myDictionary: [String, Int] = [:]
         */
        
        scores["Oli"] = 200;
        scores.updateValue(300, forKey: "Mike");
        
        print(scores);
        
        let oldValue = scores.updateValue(100, forKey: "Richard");
        print(oldValue!);
        
        /* Swift will execute the print inside the if statement
         * if scores.updateValue returns something (i.e. the old value)
         */
        
        if let oldVal = scores.updateValue(100, forKey: "Richard"){
            print("Richard's old values was \(oldVal)");
        }
        
        /* Remove element from a dictionary */
        
        scores["Richard"] = nil;
        
        /* Swift will execute the print inside the if statement
         * if scores.removeValue returns something (i.e. the old value)
         */
        
        if let removedVal = scores.removeValue(forKey: "Luke"){
            print("Luke's score was \(removedVal) before he stopped playing");
        }
        
        /* Extract keys and values from dictionary as an array*/
        let players = Array(scores.keys);
        let points = Array(scores.values);
        
        print(players);
        print(points);
        
        /* Swift will print the statement if the dictionary returns a value */
        
        if let lukesScore = scores["Luke"]{
            print(lukesScore);
        }
        if let oilScore = scores["Oli"]{
            print(oilScore);
        }
        
        //==========
        // LOOPS
        //==========
        
        /* for-in loop
         * the "..." is called close range operator
         * defines a range of values from x up to y
         * there is an half-open range operator "..<"
         * that runs from x up to y, without including y
         */
        for index in 1...5{
            print("This is number \(index)");
        }
        
        /* It is possible to loop with a discard operator*/
        for _ in 1...3{
            print("Hello!");
        }
        
        /* It is possible to loop through arrays*/
        let namesLoop = ["Aga", "Antonio", "Rody"];
        for name in namesLoop{
            print("Hello \(name)");
        }
        for index in 0..<namesLoop.count{
            print("\(index): \(namesLoop[index])");
        }
        
        /* It is possible to loop through strings*/
        for letter in "ABCD"{
            print("The letter is \(letter)");
        }
        /* If index is needed with a string/array loop
         * it is possible to use the .enumerated() method
         */
        for (index, letter) in "ABCD".enumerated(){
            print("\(index): \(letter)");
        }
        
        /* It is possible to loop through dictionaries*/
        let vehicles = ["unicycle": 1, "bicycle": 2, "trycicle": 3, "quad bike": 4];
        for (vehicleName, wheelCount) in vehicles{
            print("A \(vehicleName) has \(wheelCount) wheels");
        }
        
        
        /* while loop */
        var numberOfLives = 3;
        var stillAlive = true;
        while stillAlive{
            numberOfLives -= 1;
            if numberOfLives == 0{
                stillAlive = false;
            }
        }
        
        /* repeat-while loop (do-while) */
        var steps = 0;
        let wall = 2;
        
        repeat{
            print("Step");
            
            steps += 1;
            
            if steps == wall{
                print("You've hit a wall!");
                break;
            }
        } while steps < 10
        
    }

    
    

    
}

