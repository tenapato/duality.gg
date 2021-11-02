//
//  ProfileViewController.swift
//  Duality.gg
//
//  Created by user189106 on 9/29/21.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController {
    var userLoggedIn = true
    
    var uid = ""
    var db = Firestore.firestore()
    
    var datos = [UserElement]()
    var userControlador = ProfileController()
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var rankedRating: UILabel!
    
    @IBOutlet weak var userTag: UILabel!
    
    @IBOutlet weak var userBadge: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userLoggedIn = false
        if userLoggedIn{
            notLoggedIn()
            //let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            //self.present(loginViewController, animated: true)
            
        }
        
        
            let user = Auth.auth().currentUser
            //print(user!.uid)
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
            self.rankedRating.text = String(self.datos[0].rankedRating)
            self.userTag.text = String(self.datos[0].tagLine)
            
            if(self.datos[0].rankedRating <= 300){
                self.userBadge.image = UIImage(named: "Iron.png");
            }
            if(self.datos[0].rankedRating > 300 && self.datos[0].rankedRating < 600 ){
                self.userBadge.image = UIImage(named: "Bronce.png");
            }
            if(self.datos[0].rankedRating > 600 && self.datos[0].rankedRating < 900 ){
                self.userBadge.image = UIImage(named: "Silver.png");
            }
            if(self.datos[0].rankedRating > 900 && self.datos[0].rankedRating < 1200 ){
                self.userBadge.image = UIImage(named: "Gold.png");
            }
            if(self.datos[0].rankedRating > 1200 && self.datos[0].rankedRating < 1500 ){
                self.userBadge.image = UIImage(named: "Platinum.png");
            }
            if(self.datos[0].rankedRating > 1500 && self.datos[0].rankedRating < 1800 ){
                self.userBadge.image = UIImage(named: "Diamond.png");
            }
            if(self.datos[0].rankedRating > 1800 && self.datos[0].rankedRating < 2100 ){
                self.userBadge.image = UIImage(named: "Inmortal.png");
            }
            if(self.datos[0].rankedRating > 2100){
                self.userBadge.image = UIImage(named: "Radiant.png");
            }
           
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

                secondViewController.hidesBottomBarWhenPushed = false
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
