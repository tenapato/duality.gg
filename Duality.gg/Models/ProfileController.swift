//
//  ProfileController.swift
//  Duality.gg
//
//  Created by user189106 on 9/30/21.
//

import Foundation
import Firebase

class ProfileController{
    let db = Firestore.firestore()
    /*
    func fetchUser(completion: @escaping (Result<User,Error>)->Void){
        var urlComponents = URLComponents(string: "http://martinmolina.com.mx/202113/tc2024/equipo6/user.json")!

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data{
                do{
                    let user = try? jsonDecoder.decode(User.self, from: data)
                    completion(.success(user!))
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
    
    
    //print(user!.uid)
    
    
    
    func fetchUser(completion: @escaping (Result<User,Error>)->Void){
        let user = Auth.auth().currentUser
        print(user!.uid)
        
        let docRef = db.collection("users").document(user!.uid)
        var lista_user = [UserElement]()
        
    
        /*
        db.collection("users").whereField("gameName", isEqualTo: "ASAP Pato").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: (err)")
            } else {
                for document in querySnapshot!.documents {
                    print("(document.documentID) => (document.data())")
                    var r = UserElement(d:document)
                    lista_user.append(r)
                }
                completion(.success(lista_user))
            }
        }*/
        docRef.getDocument(source: .server) { (document, error) in
          if let document = document {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Cached document data: \(dataDescription)")
            var r = UserElement(d:document)
            lista_user.append(r)
            completion(.success(lista_user))
          } else {
            print("Document does not exist in cache")
          }
        }
        
    
    }
    
    
}



