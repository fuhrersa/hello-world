//
//  ViewController.swift
//  HelloWorld
//
//  Created by Samuel Fuhrer on 7/18/17.
//  Copyright © 2017 Samuel Fuhrer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties

    @IBOutlet weak var myLabel: UILabel!

    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    
    @IBAction func setDefaultText(sender: UIButton) {
        myLabel.text = "lkjlkj"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

