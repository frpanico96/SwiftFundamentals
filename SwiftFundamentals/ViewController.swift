//
//  ViewController.swift
//  SwiftFundamentals
//
//  Created by Francesco Panico on 21/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var setTextBtn: UIButton!
    @IBOutlet var clearTextBtn: UIButton!
    
    let labelPlaceholder: String = "Write on the textField";
    let alphaPlaceholder: Double = 0.5;
    let alphaActive: Double = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
         * For the purpose of excercising
         * set button is connected programmatically
         * clear button is connected with the storyboard UI
         */
        setTextBtn.addTarget(self, action: #selector(setText(_:)), for: .touchUpInside);
        textLabel.text = labelPlaceholder;
        textLabel.alpha = alphaPlaceholder;
    }

    @IBAction func clearText(_ sender: UIButton) {
        textField.text = "";
        textLabel.text = labelPlaceholder;
        textLabel.alpha = alphaPlaceholder
    }
    
    @IBAction func setText(_ sender: UIButton){
        textLabel.alpha = alphaActive;
        textLabel.text = textField.text;
    }
    
}

