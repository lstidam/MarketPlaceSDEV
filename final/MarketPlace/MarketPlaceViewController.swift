//
//  ViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/26/23.
//

import UIKit

// manages the login screen
class MarketPlaceViewController: UIViewController {
    
    @IBOutlet var loginUserName: UITextField!
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var createAccountButton: UIButton!
    @IBOutlet var loginError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginError.text = ""
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 15
        createAccountButton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let passed = validateUserInput()
        if !passed {
            return
        }
        let validatedUser = User(userName: loggedInUserName, userPassword: loggedInUserPassword)
        guard users.contains(validatedUser) else {
            loginError.text = "UserName and Password not found"
            return
        }
        performSegue(withIdentifier: "loginToNavigationSegue", sender: self)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        let passed = validateUserInput()
        if !passed {
            return
        }
        let newUser = User(userName: loggedInUserName, userPassword: loggedInUserPassword)
        users.append(newUser)
        performSegue(withIdentifier: "loginToNavigationSegue", sender: self)
    }
    
    func validateUserInput() -> Bool {
        guard let userName = loginUserName.text else { return false }
            loggedInUserName = userName
        guard loggedInUserName != "" else {
            loginError.text = "Please enter Username"
            return false
        }
        guard let userPassword = loginPassword.text else { return false }
            loggedInUserPassword = userPassword
        guard loggedInUserPassword != "" else {
            loginError.text = "Please enter Password"
            return false
        }
        return true
    }
}

