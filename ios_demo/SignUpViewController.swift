//
//  SignUpViewController.swift
//  ios_demo
//
//  Created by Parth Nakum on 19/09/24.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
//    private var isPasswoeordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupPasswordToggle()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("error")
            } else {
                print("sign up successful")
                // go to home screen
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
        
    }
    
    // setup eye icon in the password text field
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
