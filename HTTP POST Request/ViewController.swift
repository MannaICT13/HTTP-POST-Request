//
//  ViewController.swift
//  HTTP POST Request
//
//  Created by Md Khaled Hasan Manna on 31/8/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        JsonPostData()
        
    }


    func JsonPostData(){
        
        
        guard let  url = URL(string: "https://jsonplaceholder.typicode.com/posts/") else{return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let postString = "userId=200&title=Hello&body=World"
        
        request.httpBody =  postString.data(using: .utf8)
        
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            if let data = data,let dataStrinng = String(data: data, encoding: .utf8){
                print(dataStrinng)
                
                
            }
            
            
            
            
            
        }
        task.resume()
        
        
        
        
        
    }
    
}

