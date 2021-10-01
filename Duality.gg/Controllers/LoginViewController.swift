//
//  LoginViewController.swift
//  Duality.gg
//
//  Created by user189106 on 9/29/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    var userLoggedIn = false
    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let siguiente = segue.destination as! ProfileViewController
        // Add Riot Authentication Method
        siguiente.userLoggedIn = true
        
    }
    

}
