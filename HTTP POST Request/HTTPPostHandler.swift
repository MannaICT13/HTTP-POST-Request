//
//  HTTPPostHandler.swift
//  HTTP POST Request
//
//  Created by Md Khaled Hasan Manna on 1/9/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import UIKit

class HTTPPostHandler {
    
    
    
    func POSTHandle(){
        
    guard let  url = URL(string: "https://jsonplaceholder.typicode.com/posts/") else{return}
    var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let postString = Todos(userId: 200, title: "Shop", body: "BigShop")
        let jsonData = try! JSONEncoder().encode(postString)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                return
                
            }
            
            guard let data = data else{return}
            
            do{
                
            let todosItem =     try JSONDecoder().decode(Todos.self, from: data)
                
                print(todosItem)
                print(todosItem.title ?? "n/a")
                print(todosItem.body ?? "n/a")
                
            }catch let err{
                print(err.localizedDescription)
                
            }
            
            
            
            
            
            
        }
        task.resume()
        
        
    }
    
}
