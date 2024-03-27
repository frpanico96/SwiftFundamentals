//
//  ViewController.swift
//  SwiftFundamentals
//
//  Created by Francesco Panico on 21/03/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    
    @IBAction func onPressBtn(_ sender: Any) {
        print("The button was pressed")
        mainLabel.text = "This app rocks!"
    }
    @IBOutlet var clickMeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Debugging"
        
        var names = ["Tammy", "Cole"]
        names.removeFirst()
        names.removeFirst()
        //names.removeFirst()
        
        clickMeBtn.tintColor = .red
        
        // Do any additional setup after loading the view.
        //let x = 4
    }


}

