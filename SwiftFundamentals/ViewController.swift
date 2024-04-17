//
//  ViewController.swift
//  SwiftFundamentals
//
//  Created by Francesco Panico on 21/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var toggle: UISwitch!
    @IBOutlet var btn: UIButton!
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
         * It is possible to connect actions programmatically
         * it is best practice to perform connections in the viewDidLoad
         */
        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    /*
     * The default value for a button event is
     * is "Touch Up Inside"
     * which represents taps and relses the touch
     * from the button
     */
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("Button was tapped")
        
        if toggle.isOn{
            print("The switch is on!");
        } else {
            print("The switch is off.");
        }
        
        print("The slider is set to \(slider.value)");
        
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        if sender.isOn{
            print("The switch is on!");
        } else {
            print("The switch is off.");
        }
    }
    @IBAction func followSlider(_ sender: UISlider) {
        print(sender.value);
    }
    @IBAction func setLabelOnDone(_ sender: UITextField) {
        if let txt = sender.text{
            print(txt);
        }
    }
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location);
    }
}

