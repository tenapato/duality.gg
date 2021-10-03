//
//  CalculatorViewController.swift
//  Duality.gg
//
//  Created by user189106 on 10/1/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var TextCT: UITextField!
    @IBOutlet weak var TextCXP: UITextField!
    @IBOutlet weak var TextR: UILabel!
    @IBOutlet weak var TextCR: UILabel!
    
    var xpbase = 0
    var xprestante = 0
    var gamesrestantes = 0.0
    
    @IBAction func Calcular(_ sender: Any) {
        xpbase = 0
        xprestante = 0
        gamesrestantes = 0.0
        
        let ctnum = Int(TextCT.text!)
        let cxpnum = Int(TextCXP.text!)
        
        xpbase = ObtenerXP(CT: ctnum!)
        //print(ObtenerXP(CT: ctnum!))
        
        
        for n in ctnum!+1...50 {
            xprestante += ObtenerXP(CT: n)
        }
        //print(xprestante+cxpnum!)
        TextR.text = String(xprestante+cxpnum!)
        
        gamesrestantes = Double((xprestante+cxpnum!)/4000)
        TextCR.text = String(Int(gamesrestantes))

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func ObtenerXP(CT: Int) -> Int{
        let res = 2000+(750*(CT-2))
        return res
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
