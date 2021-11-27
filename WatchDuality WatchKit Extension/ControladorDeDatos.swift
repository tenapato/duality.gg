//
//  ControladorDeDatos.swift
//  WatchDuality WatchKit Extension
//
//  Created by user191401 on 11/23/21.
//

import Foundation
import Firebase

class ControladorDatos{
    
    func fetchUser(completion: @escaping (Result<[users],Error>)->Void){
        
        var lista_user = [users]()
        
        
        let ref = Database.database().reference()
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Dictionary<String,String>]{
            let dic = data["users"]!
                for (k, v) in dic{
                let r = users(gameName: v, rankedRating: v, tagLine: k)
                print(k)
                print(v)
                print(r)
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
