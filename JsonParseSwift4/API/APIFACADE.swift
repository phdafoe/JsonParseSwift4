//
//  APIFACADE.swift
//  iCoNews
//
//  Created by Andres on 13/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

class APIFacadeManager: NSObject {
    
    let customUrl = CONSTANTES.LLAMADAS.BASE_API_URL
    let apiKey = CONSTANTES.LLAMADAS.BASE_KEY
    var parserGeneral = ParserGeneral()
    
    //API paso 2
    let session = URLSession.shared
    
    
    //contiene un objeto del tipo APIFacadeManager - con static se consigue que se ejecute una unica vez
    //static let sharedInstance = APIFacadeManager()
    //MARK: - SINGLETON
    class var sharedInstance : APIFacadeManager {
        struct SingletonAPP {
            static let instancia = APIFacadeManager()
        }
        return SingletonAPP.instancia
    }
    
    //MARK: - GET ASOCIACIONES
    func getDatosFromWeb(_ idFuente : String) -> [ModelGeneralData]{
        let url = customUrl + idFuente + CONSTANTES.LLAMADAS.BASE_PARAMETR + apiKey
        let request = URL(string: url)
        var arrayData : [ModelGeneralData]?
        do {
            let jsonData = try Data(contentsOf: request!)
            arrayData =  parserGeneral.setParseFromWeb(jsonData as NSData)
        } catch let error {
            print(error)
        }
        return arrayData!
    }
    
    // asynchronous API 1
//    func getDataURLRequest(_ idFuente : String) -> [ModelGeneralData]{
//        let url = customUrl + idFuente + CONSTANTES.LLAMADAS.BASE_PARAMETR + apiKey
//        let request = URL(string: url)
//        var arrayData : [ModelGeneralData]?
//        let (data, response, error) = { Set(URL).await }//get(URL).await()
//        return arrayData!
//    }
    
    func getDataURLRequest(_ idFuente : String, completionHandler: @escaping (_ array : [ModelGeneralData]) -> ()) {
        let url = customUrl + idFuente + CONSTANTES.LLAMADAS.BASE_PARAMETR + apiKey
        let request = URL(string: url)
        var arrayData = [ModelGeneralData]()
        let task = session.dataTask(with: request!) { (data, response, error) in
            if let dataDes = data{
                do{
                    let jsonSerialized = try JSONSerialization.jsonObject(with: dataDes, options: []) as? [String : Any]
                    if let jsonDes = jsonSerialized{
                        arrayData =  self.parserGeneral.setParserfromTask(jsonDes["articles"] as! [ModelGeneralData])
                    }
                    completionHandler(arrayData)
                }catch let error as NSError {
                    print(error.localizedDescription)
                }
            }else if let errorDes = error {
                print(errorDes.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    
    
    
    
}
