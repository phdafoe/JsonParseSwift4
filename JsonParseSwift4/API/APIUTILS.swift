//
//  APIUTILS.swift
//  iSaldos
//
//  Created by Andres on 13/4/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation
import SwiftyJSON

let CONSTANTES = Constantes()

struct Constantes {
    let COLORES = Colores()
    let LLAMADAS = LLamadas()
}

struct Colores {
    let GRIS_NAV_TAB = #colorLiteral(red: 0.2765139249, green: 0.2765139249, blue: 0.2765139249, alpha: 1)
    let BLANCO_TEXTO_NAV = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let AZUL_BARRA_NAV = #colorLiteral(red: 0.2039215686, green: 0.5960784314, blue: 0.8352941176, alpha: 1)
}

struct LLamadas {
    
    let BASE_KEY = "f4dce617fbf2407294a9c0d358024eb4"
    
    let BASE_ESPN = "espn"
    let BASE_FOX_SPORTS = "fox-sports"
    let BASE_MARCA = "marca"
    let BASE_LEQUIPE = "lequipe"
    let BASE_NFL_NEWS = "nfl-news"
    let BASE_NHL_NEWS = "nhl-news"
    let BASE_BLACHER_NEWS = "bleacher-report"
    let BASE_FOOTBAL_ITALIA = "football-italia"
    let BASE_TALK_NEWS = "talksport"
    let BASE_MTV = "mtv-news"
    let BASE_MTV_UK = "mtv-news-uk"
    let BASE_TECHRUNCH = "techcrunch"
    let BASE_ENGADGET = "engadget"
    let BASE_HACKER_NEWS = "hacker-news"
    let BASE_CRIPTO_COINS = "crypto-coins-news"
    
    
    let BASE_PARAMETR = "&apiKey="
    
    let BASE_API_URL = "https://newsapi.org/v2/top-headlines?sources="
}

//MARK: - NULL TO STRING
public func dimeString(_ j : JSON, nombre : String) -> String{
    if let stringResult = j[nombre].string{
        return stringResult
    }else{
        return ""
    }
}

func muestraAlertVC(_ titleData : String, messageData : String) -> UIAlertController{
    let alert = UIAlertController(title: titleData, message: messageData, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    return alert
}

public func dameFecha(_ fecha : String) -> Date?{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE, dd MMM"
    dateFormatter.locale = Locale(identifier: "es_ES")
    return dateFormatter.date(from: fecha)
}



