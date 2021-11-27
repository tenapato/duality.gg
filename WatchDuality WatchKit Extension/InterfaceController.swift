//
//  InterfaceController.swift
//  WatchDuality WatchKit Extension
//
//  Created by user191401 on 11/23/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var table: WKInterfaceTable!
    var datos = [users]()
    var profileController = ControladorDatos()
    func updateGUI(lista_user: [users]){
        DispatchQueue.main.async {
            self.datos = lista_user
            self.table.setNumberOfRows(self.datos.count, withRowType: "lines")
            for index in 0 ..< self.datos.count {
                let theLine = self.table.rowController(at: index) as! TableController
                theLine.labelUser.setText(self.datos[index].gameName)
            }
        }
    }
    func displayError(e:Error){
        DispatchQueue.main.async {
            print(e)
        }
    }
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        profileController.fetchUser { (result) in
            switch result{
            case .success(let lista_user): self.updateGUI(lista_user: lista_user)
            case.failure(let error): self.displayError(e : error)
            }
    
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
