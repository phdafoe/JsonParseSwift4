//
//  APIPARSE.swift
//  iCoNews
//
//  Created by Andres on 24/11/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

class ParserGeneral: NSObject {
    
    let customUrl = CONSTANTES.LLAMADAS.BASE_API_URL
    let apiKey = CONSTANTES.LLAMADAS.BASE_KEY
    //var jsonDataNews : JSON?
    
//    func getDatosFromWeb(_ idFuente : String)-> Promise<JSON>{
//        let request = URLRequest(url: URL(string: customUrl + idFuente + CONSTANTES.LLAMADAS.BASE_PARAMETR + apiKey)!)
//        print(request)
//
//        return Alamofire.request(request).responseJSON().then{(data) -> JSON in
//            self.jsonDataNews = JSON(data)
//            return self.jsonDataNews!
//        }
//    }
    
    func setParseFromWeb(_ dataFromNetworking : NSData) -> [ModelGeneralData]{
        var arrayModel = [ModelGeneralData]()
        let readableJSON = JSON(data: dataFromNetworking as Data, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        for c_obj in (readableJSON["articles"]){
            
            let sourceDictionary = Source(pId: dimeString(c_obj.1["source"], nombre: "id"),
                                          pName: dimeString(c_obj.1["source"], nombre: "name"))
            
            let articlesArray = Articles(pSource: sourceDictionary,
                                        pAuthor: dimeString(c_obj.1, nombre: "author"),
                                        pTitle: dimeString(c_obj.1, nombre: "title"),
                                        pDescripcion: dimeString(c_obj.1, nombre: "description"),
                                        pUrl: dimeString(c_obj.1, nombre: "url"),
                                        pUrlToImage: dimeString(c_obj.1, nombre: "urlToImage"),
                                        pPubishedAt: dimeString(c_obj.1, nombre: "publishedAt"))
            
            
            
            
            let modelData = ModelGeneralData(pArticles: articlesArray)
            
            arrayModel.append(modelData)
        }
        return arrayModel
    }
    
    func setParserfromTask(_ array_Obj : [ModelGeneralData]) -> [ModelGeneralData]{
        var arrayModel = [ModelGeneralData]()
        for item in array_Obj{
            let modelData = ModelGeneralData(pArticles: articlesArray)
            
            let articlesArray = Articles(pSource: sourceDictionary,
                                         pAuthor: item["author"],
                                         pTitle: item["title"],
                                         pDescripcion: item["description"],
                                         pUrl: item["url"],
                                         pUrlToImage: item["urlToImage"],
                                         pPubishedAt:item["publishedAt"])
            
            
            let sourceDictionary = Source(pId: array_Obj[item]["source"]["id"],
                                          pName: array_Obj["source"]["name"])
            
            arrayModel.append(modelData)
        }
        return arrayModel
    }
    
    
}


