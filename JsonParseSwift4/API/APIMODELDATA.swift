//
//  APIMODELDATA.swift
//  iCoNews
//
//  Created by Andres on 24/11/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation

class ModelGeneralData : NSObject {
    
    //let status : String
    let articles : Articles
    
    init(pArticles : Articles) {
        //self.status = pStatus
        self.articles = pArticles
        super.init()
    }
    
}

class Articles : NSObject {
    
    let source : Source
    let author : String
    let title : String
    let descripcion : String
    let url : String
    let urlToImage : String
    let publishedAt : String
    
    init(pSource : Source, pAuthor : String, pTitle : String, pDescripcion : String, pUrl : String, pUrlToImage : String, pPubishedAt : String) {
        
        self.author = pAuthor
        self.source = pSource
        self.title = pTitle
        self.descripcion = pDescripcion
        self.url = pUrl
        self.urlToImage = pUrlToImage
        self.publishedAt = pPubishedAt
        super.init()
    }
    
}

class Source : NSObject {
    let id : String
    let name : String
    
    init(pId : String, pName : String) {
        self.id = pId
        self.name = pName
        super.init()
    }
    
    
}
