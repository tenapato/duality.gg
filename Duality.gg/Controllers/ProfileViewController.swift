//
//  ProfileViewController.swift
//  Duality.gg
//
//  Created by user189106 on 9/29/21.
//

import UIKit

class ProfileViewController: UIViewController {
    var userLoggedIn = true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userLoggedIn = true
        if userLoggedIn{
            notLoggedIn()
            //let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            //self.present(loginViewController, animated: true)
            
        }
        
    }
    
    
    func notLoggedIn(){
        //let loginScreen = LoginViewController()
        //self.present(loginScreen, animated: true)
        if let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {

                    self.present(secondViewController, animated: true, completion: nil)
                }
        
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
