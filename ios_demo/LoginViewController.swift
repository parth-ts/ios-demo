//
//  LoginViewController.swift
//  ios_demo
//
//  Created by Parth Nakum on 19/09/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // login button functionality
    func loginFunction(){
        guard let email = emailTextField?.text, !email.isEmpty,
              let password = passwordTextField?.text, !password.isEmpty
        else {
            print("Email or password is empty.")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("error: ", e)
            } else {
                print("login successful")
                // go to home screen
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
    
    // click login button
    @IBAction func loginClicked(_ sender: UIButton) {
        loginFunction()
    }
    
    // for testing
    func setEmailTextField(text: String){
        emailTextField?.text = text
    }
    func setPasswordTextField(text: String){
        emailTextField?.text = text
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
