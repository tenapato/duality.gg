//
//  UserAuthViewController.swift
//  Duality.gg
//
//  Created by user189106 on 10/31/21.
//

import UIKit
import FirebaseAuth

class UserAuthViewController: UIViewController {
    var uid = ""
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let siguiente = segue.destination as! ProfileViewController
        // Add Riot Authentication Method
        siguiente.userLoggedIn = true
        
        
    }
    */
    
    
    @IBAction func login(_ sender: Any) {
        
        // Validate text fields
        let email = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // Siging in user
        Auth.auth().signIn(withEmail: email, password: password){
            (result, error) in
            if error != nil{
                // Couldnt sign in
                print("Error signin in")
            } else{
                // Transintion to user page
                
                //print(result!.user.uid)
                self.transitionToUserPage()
            }
        }
        
    
}
    
    
    
    func transitionToUserPage(){
        let  profileViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.profileViewController) as? ProfileViewController
        //profileViewController?.uid = uid
        profileViewController?.userLoggedIn = false
        view.window?.rootViewController = profileViewController
        view.window?.makeKeyAndVisible()
    }
    
    
    
    
    
}
