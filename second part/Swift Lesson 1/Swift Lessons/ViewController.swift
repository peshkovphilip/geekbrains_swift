//
//  ViewController.swift
//  Swift Lessons
//
//  Created by Филипп on 30/06/2019.
//  Copyright © 2019 Филипп Пешков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginBtnTouch(_ sender: Any) {
        print("username: \(loginField.text)")
        print("password: \(PasswordField.text)")
    }
}

