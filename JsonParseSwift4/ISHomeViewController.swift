//
//  ISHomeViewController.swift
//  iSaldos
//
//  Created by Andres on 13/4/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ISHomeViewController: UIViewController {
    
    //MARK: - Variables locales
    var items = NSArray()
    var customTabSwipeNavigation : CarbonTabSwipeNavigation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = ["ESPN", "Fox Sports", "NFL News", "NHL News", "Bleacher Report", "Marca", "Football Italia", "l'equipe", "TalkSport"]
        customTabSwipeNavigation = CarbonTabSwipeNavigation(items: (items as! [Any]), delegate: self)
        customTabSwipeNavigation.insert(intoRootViewController: self)
        style()
        
        // Do any additional setup after loading the view.
    }
    
    
    func style(){
        let customColor = CONSTANTES.COLORES.GRIS_NAV_TAB
        customTabSwipeNavigation.toolbar.isTranslucent = false
        customTabSwipeNavigation.setIndicatorColor(customColor)
        customTabSwipeNavigation.carbonSegmentedControl?.setWidth(self.view.frame.width / 2, forSegmentAt: 0)
        customTabSwipeNavigation.carbonSegmentedControl?.setWidth(self.view.frame.width / 2, forSegmentAt: 1)
        customTabSwipeNavigation.setNormalColor(customColor.withAlphaComponent(0.6))
        customTabSwipeNavigation.setSelectedColor(customColor, font: UIFont.boldSystemFont(ofSize: 14))
    }
    
    

}

extension ISHomeViewController : CarbonTabSwipeNavigationDelegate{
    
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        switch index {
        case 0:
            return self.storyboard?.instantiateViewController(withIdentifier: "ESPNTableViewController") as! ESPNTableViewController
        case 1:
            return self.storyboard?.instantiateViewController(withIdentifier: "FOXSPORTSTableViewController") as! FOXSPORTSTableViewController
        case 2:
            return self.storyboard?.instantiateViewController(withIdentifier: "NFLNEWSTableViewControllerg") as! NFLNEWSTableViewController
        case 3:
            return self.storyboard?.instantiateViewController(withIdentifier: "NHLNEWSTableViewController") as! NHLNEWSTableViewController
        case 4:
            return self.storyboard?.instantiateViewController(withIdentifier: "BLEACHERREPORTTableViewController") as! BLEACHERREPORTTableViewController
        case 5:
            return self.storyboard?.instantiateViewController(withIdentifier: "MARCATableViewController") as! MARCATableViewController
        case 6:
            return self.storyboard?.instantiateViewController(withIdentifier: "FOOTBALITALIATableViewController") as! FOOTBALITALIATableViewController
        case 7:
            return self.storyboard?.instantiateViewController(withIdentifier: "LEQUIPETableViewController") as! LEQUIPETableViewController
        default:
            return self.storyboard?.instantiateViewController(withIdentifier: "TALKSPORTTableViewController") as! TALKSPORTTableViewController
        }
    }
    
}


