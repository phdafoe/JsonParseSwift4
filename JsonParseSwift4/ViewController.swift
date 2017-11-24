//
//  ViewController.swift
//  JsonParseSwift4
//
//  Created by Andres on 24/11/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

struct WebSiteDescription: Decodable {
    let name : String
    let description : String
    let courses : [Course]
}


struct Course : Decodable {
    let id : Int
    let name : String
    let link : String
    let imageUrl : String
    
//    init(json : [String : Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//
//    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let customURL = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: customURL) { (data, respose, error) in
            
            guard let customData = data else {return}
            
//            if let customData = data{
//                 let dataAsString = String(data: customData, encoding: .utf8)
//                 print(dataAsString)
//            }
            
//            let dataAsString = String(data: customData, encoding: .utf8)
//
//            print(dataAsString)
            
            do{
                //Swift 2/3/Objc
                /*guard let json = try JSONSerialization.jsonObject(with: customData, options: .mutableContainers) as? [String : Any] else{return}
                //print(json)
                let customCourse = Course(json: json)
                print(customCourse.name)*/
                
                //SWIFT4
                let webSiteDescription = try JSONDecoder().decode(WebSiteDescription.self, from: customData)
                //let courses = try JSONDecoder().decode([Course].self, from: customData)
                print(webSiteDescription)
                
            }catch let errorJson{
                print("Error serializando json:", errorJson)
            }
        
           
            
        }.resume()
        
        
        /*let myCourse = Course(id: 1, name: "myCourse", link: "Algun link", imageUrl: "alguna imagen")
        
        print(myCourse)*/
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

