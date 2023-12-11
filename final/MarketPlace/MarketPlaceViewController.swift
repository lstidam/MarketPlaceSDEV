//
//  ViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/26/23.
//

import UIKit

class MarketPlaceViewController: UIViewController {

    var loggedInUserPassword = ""
    
    @IBOutlet var loginUserName: UITextField!
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loginError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginError.text = ""
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let userName = loginUserName.text else { return }
            loggedInUserName = userName
        guard loggedInUserName != "" else {
            loginError.text = "Please enter Username"
            return
        }
        guard let userPassword = loginPassword.text else { return }
            loggedInUserPassword = userPassword
        guard loggedInUserPassword != "" else {
            loginError.text = "Please enter Password"
            return
        }
        let validatedUser = User(userName: loggedInUserName, userPassword: loggedInUserPassword)
        guard users.contains(validatedUser) else {
            loginError.text = "UserName and Password not found"
            return
        }
        performSegue(withIdentifier: "loginToNavigationSegue", sender: self)
    }
}

