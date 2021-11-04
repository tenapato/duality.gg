//
//  AddMatchViewController.swift
//  Duality.gg
//
//  Created by user189106 on 11/1/21.
//

import UIKit
import Firebase
class AddMatchViewController: UIViewController {
    var db = Firestore.firestore()
    @IBOutlet weak var matchIDTextField: UITextField!
    
    @IBOutlet weak var roundsWonTextField: UITextField!
    @IBOutlet weak var MapIDTextField: UITextField!
    @IBOutlet weak var isRankedSwitch: UISwitch!
    @IBOutlet weak var killsTextField: UITextField!
    @IBOutlet weak var deathsTextField: UITextField!
    @IBOutlet weak var assistsTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var wonSwitch: UISwitch!
    @IBOutlet weak var teamSegControl: UISegmentedControl!
    @IBOutlet weak var agentTextField: UITextField!
    @IBOutlet weak var roundsPlayerTextField: UITextField!
    
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
    }
    */

    @IBAction func submitTouched(_ sender: Any) {
        // Validate Inputs
        
        // Clear Inputs
        let matchId = matchIDTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let mapId = MapIDTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let kills = killsTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let deaths = deathsTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let assists = assistsTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let score = scoreTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let rounds = roundsWonTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let roundsPlayed = roundsPlayerTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var won = false
        if wonSwitch.isOn{
             won = true
        } 
        var isRanked = false
        
        if isRankedSwitch.isOn{
             isRanked = true
        }
        var team = ""
        if teamSegControl.selectedSegmentIndex == 0 {
             team = "Green"
        } else {
             team = "Red"
        }
        
        let agent = agentTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let user = Auth.auth().currentUser
        // Add data to Firestore
        var ref: DocumentReference? = nil
               ref = db.collection("matches").addDocument(data: [
                    "uid": user!.uid,
                   "teamId": team,
                   "score": Int(score),
                "roundsWon": Int(rounds),
                "roundsPlayed": Int(roundsPlayed),
                "matchId": matchId,
                "mapId": mapId,
                "kills": Int(kills),
                "deaths": Int(deaths),
                "assists": Int(assists),
                "isRanked": isRanked,
                "won": won,
                "CharId": agent
                
               ]) { err in
                   if let err = err {
                       print("Error adding document: \(err)")
                   } else {
                       print("Document added with ID: \(ref!.documentID)")
                        self.transitionToUserPage()
                   }
               }
        
    }
    
    func transitionToUserPage(){
        let  profileViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.profileViewController) as? ProfileViewController
        let  tabBarViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarViewController) as? TabBarViewController
        //profileViewController?.uid = uid
        //profileViewController?.userLoggedIn = false
        view.window?.rootViewController = profileViewController
        view.window?.makeKeyAndVisible()
        tabBarViewController?.tabBar.isHidden = false
        
    }
    
}
