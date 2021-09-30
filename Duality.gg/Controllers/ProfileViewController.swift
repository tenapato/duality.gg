//
//  ProfileViewController.swift
//  Duality.gg
//
//  Created by user189106 on 9/29/21.
//

import UIKit

class ProfileViewController: UIViewController {
    var userLoggedIn = true
    
    var datos = [UserElement]()
    var userControlador = ProfileController()
    
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userLoggedIn = true
        if userLoggedIn{
            notLoggedIn()
            //let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            //self.present(loginViewController, animated: true)
            
        }
        userControlador.fetchUser{ (resultado) in
            switch resultado{
            case .success(let listaUser):self.updateGUI(listaUser: listaUser)
            case .failure(let error):self.displayError(e: error)
            }
            
        }
        
        
        
    }
    
    func updateGUI(listaUser: [UserElement]){
        DispatchQueue.main.async {
            self.datos = listaUser
            //self.tableView.reloadData()
            //print(self.datos)
            self.userName.text = String(self.datos[0].gameName)
        }
        
    }
    func displayError(e:Error){
        DispatchQueue.main.async {
            let alerta =  UIAlertController(title: "Error de conexion", message: e.localizedDescription, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alerta, animated: true, completion: nil)
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
