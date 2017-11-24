//
//  APIMODELDATA.swift
//  iCoNews
//
//  Created by Andres on 24/11/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation

struct ModelGeneralData: Decodable {
    
    let status : String
    let articles : [Articles]
    
}

struct Articles : Decodable {
    
    let source : Source
    let author : String
    let title : String
    let description : String
    let url : String
    let urlToImage : String
    let publishedAt : String
}

struct Source : Decodable {
    let id : String
    let name : String
}
