//
//  ControladorDeDatos.swift
//  WatchDuality WatchKit Extension
//
//  Created by user191401 on 11/23/21.
//

import Foundation
import Firebase

class ControladorDatos{
    
    func fetchUser(completion: @escaping (Result<[UserElement],Error>)->Void){
        
        var lista_user = [UserElement]()
        
        
        let ref = Database.database().reference()
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Dictionary<String,AnyObject>]{
            let dic = data["UserElement"]!
            for (k,v) in dic{
                let r = UserElement(gameName: k, rankedRating: v as! Int)
                lista_user.append(r)
            }
            completion(.success(lista_user))
    }
            
        }){
            (error) in
            completion(.failure(error))
            print(error.localizedDescription)
        }
        
    }


    
}
