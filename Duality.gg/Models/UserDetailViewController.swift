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
