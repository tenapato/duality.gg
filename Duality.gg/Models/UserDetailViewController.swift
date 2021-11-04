//
//  UserDetailViewController.swift
//  Duality.gg
//
//  Created by user189106 on 11/3/21.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var rankedRatingLabel: UILabel!
    
    @IBOutlet weak var imagePlaceHolder: UIImageView!
    var user:AllUser?
    var usersControlador = UsersController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //datos = listaUser
        //self.tableView.reloadData()
        //print(self.datos)
        rankedRatingLabel.text = String(user!.rankedRating)
        gameNameLabel.text = user?.gameName
        //rankedRating.text = String(self.datos[0].rankedRating)
        tagLineLabel.text = user?.tagLine
        
        if(user!.rankedRating <= 300){
            imagePlaceHolder.image = UIImage(named: "Iron.png");
        }
        if(user!.rankedRating > 300 && user!.rankedRating < 600 ){
            imagePlaceHolder.image = UIImage(named: "Bronce.png");
        }
        if(user!.rankedRating > 600 && user!.rankedRating < 900 ){
            imagePlaceHolder.image = UIImage(named: "Silver.png");
        }
        if(user!.rankedRating > 900 && user!.rankedRating < 1200 ){
            imagePlaceHolder.image = UIImage(named: "Gold.png");
        }
        if(user!.rankedRating > 1200 && user!.rankedRating < 1500 ){
            imagePlaceHolder.image = UIImage(named: "Platinum.png");
        }
        if(user!.rankedRating > 1500 && user!.rankedRating < 1800 ){
            imagePlaceHolder.image = UIImage(named: "Diamond.png");
        }
        if(user!.rankedRating > 1800 && user!.rankedRating < 2100 ){
            imagePlaceHolder.image = UIImage(named: "Inmortal.png");
        }
        if(user!.rankedRating > 2100){
            imagePlaceHolder.image = UIImage(named: "Radiant.png");
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
