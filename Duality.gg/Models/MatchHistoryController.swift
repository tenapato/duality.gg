//
//  MatchHistoryController.swift
//  Duality.gg
//
//  Created by user189106 on 10/4/21.
//

import Foundation
import Firebase
class MatchHistoryController{
    let db = Firestore.firestore()
    
    /*func fetchMatches(completion: @escaping (Result<Matches,Error>)->Void){
        var urlComponents = URLComponents(string: "http://martinmolina.com.mx/202113/tc2024/equipo6/matches.json")!

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data{
                do{
                    let match = try? jsonDecoder.decode(Matches.self, from: data)
                    completion(.success(match!))
                }
                catch{
                    completion(.failure(error))
                }
            }
            else {
                completion(.failure(error as! Error))
            }
            
        }

        task.resume()
    
    }*/
    func fetchMatches(completion: @escaping (Result<Matches,Error>)->Void){
        let user = Auth.auth().currentUser
        print(user!.uid)
        
        //let docRef = db.collection("matches").document(user!.uid)
        var lista_matches = [Match]()
        
    
        
        db.collection("matches").whereField("uid", isEqualTo: user!.uid).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: (err)")
            } else {
                for document in querySnapshot!.documents {
                    print("(document.documentID) => (document.data())")
                    var r = Match(d:document)
                    lista_matches.append(r)
                }
                completion(.success(lista_matches))
            }
        }
        
        
        
    
    }
    
    
}
