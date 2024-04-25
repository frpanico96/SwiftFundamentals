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
        
        //============
        // OPTIONALS
        //============
        
        /*
         * nil represents the absence of a value, or nothing
         * optionals allow variables to hold nil value
         */
        
        struct Book {
            var name: String
            var publicationYear: Int?
        }
        
        _ = Book(name: "Rebels and Lions", publicationYear: nil);
        
        let serverResponseCode: Int? = nil;
        
        if let unwrappedResponseCode = serverResponseCode{
            print("Server Response", unwrappedResponseCode);
        } else {
            print("No response from the server")
        }
        
        /*
         * Functions can accepts optionals parameters
         * and can return an optional
         */
        
        func printFullName(firstName: String, middleName: String?, lastName: String){
            if let unwrappedMiddleName = middleName{
                print("\(firstName) \(unwrappedMiddleName) \(lastName)");
            } else {
                print("\(firstName) \(lastName)");
            }
        }
        
        func textFromUrl(url: URL) -> String? {
            return nil;
        }
        
        /*
         * Any initializer that may return nil is called "Failable Initiliazer"
         */
        struct Toddler{
            var name: String
            var monthsOld: Int
            
            init?(name: String, monthsOld: Int){
                if monthsOld < 12 || monthsOld > 36 {
                    return nil;
                } else {
                    self.name = name;
                    self.monthsOld = monthsOld;
                }
            }
        }
        
        let toddler = Toddler(name: "Evania", monthsOld: 14);
        
        if let unwrappedToddler = toddler {
            print("\(unwrappedToddler.name) is \(unwrappedToddler.monthsOld) months old");
        } else {
            print("The age you specified for the toddler is not between 1 and 3 yrs of age");
        }
        
        /*
         * Optional chaining
         */
        
        struct Person {
            var age: Int
            var residence: Residence?
        }
        
        struct Residence{
            var address: Address?
        }
        
        struct Address{
            var buildingNumber: String
            var streetName: String
            var apartmentNumber: String?
        }
        
        let person = Person(age: 20, residence: Residence(address: Address(buildingNumber: "2", streetName: "30", apartmentNumber: "12")))
        
        if let unwrappedAptNumber =
            person.residence?.address?.apartmentNumber{
            print("They live in apartment number \(unwrappedAptNumber)");
        }
            
        /*
         * For outlets Swift automatically use ! instead of ?
         * the ! automatically unwrap the value (e.g. UILabel)
         * ! should be used for very special case where you know the variable will be populated
         * Although is best practice to use ? most of the time.
         */
        
        
    }

    
}

