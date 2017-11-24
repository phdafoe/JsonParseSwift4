//
//  APIUTILS.swift
//  iSaldos
//
//  Created by Andres on 13/4/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation

let CONSTANTES = Constantes()

struct Constantes {
    let COLORES = Colores()
    let LLAMADAS = LLamadas()
}

struct Colores {
    let GRIS_NAV_TAB = #colorLiteral(red: 0.2765139249, green: 0.2765139249, blue: 0.2765139249, alpha: 1)
    let BLANCO_TEXTO_NAV = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
    
    let BASE_PARAMETR = "&apiKey="
    
    let BASE_API_URL = "https://newsapi.org/v2/top-headlines?sources="
}

