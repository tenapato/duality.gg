//
//  UsersController.swift
//  Duality.gg
//
//  Created by user189106 on 10/3/21.
//

import Foundation
import Firebase

class UsersController{
    let db = Firestore.firestore()
    /*
    func fetchUsers(completion: @escaping (Result<AllUsers,Error>)->Void){
        var urlComponents = URLComponents(string: "http://martinmolina.com.mx/202113/tc2024/equipo6/users.json")!

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data{
                do{
                    let user2 = try? jsonDecoder.decode(AllUsers.self, from: data)
                    completion(.success(user2!))
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
    
    }
    */
    
    func fetchUsers(completion: @escaping (Result<AllUsers,Error>)->Void){
        var lista_users = [AllUser]()
        db.collection("users").getDocuments() {QuerySnapshot, err in
            if let err = err {
                print("error no docs: \(err)")
                completion(.failure(err))
            } else{
                
                for document in QuerySnapshot!.documents{
                    var u = AllUser(d: document)
                    lista_users.append(u)
                }
                completion(.success(lista_users))
            }
        }
        
    }
    
}
