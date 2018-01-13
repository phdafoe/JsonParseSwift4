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
    
    //MARK: - IBOUTLET
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dameStatusBar(self.navigationController!)
        
        items = ["ESPN", "NFL News", "NHL News", "Bleacher Report", "Marca", "Football Italia", "l'equipe", "TalkSport"]
        customTabSwipeNavigation = CarbonTabSwipeNavigation(items: (items as! [Any]), delegate: self)
        customTabSwipeNavigation.insert(intoRootViewController: self)
        style()
        
        //TODO: - Gestion del menu superior Izq.
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rightViewRevealWidth = 150
            //view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    func style(){
        let customColor = CONSTANTES.COLORES.GRIS_NAV_TAB
        customTabSwipeNavigation.toolbar.isTranslucent = false
        customTabSwipeNavigation.setIndicatorColor(customColor)
        customTabSwipeNavigation.carbonSegmentedControl?.setWidth(self.view.frame.width / 3, forSegmentAt: 0)
        customTabSwipeNavigation.carbonSegmentedControl?.setWidth(self.view.frame.width / 3, forSegmentAt: 1)
        customTabSwipeNavigation.carbonSegmentedControl?.setWidth(self.view.frame.width / 3, forSegmentAt: 2)
        customTabSwipeNavigation.carbonSegmentedControl?.setWidth(self.view.frame.width / 3, forSegmentAt: 3)
        customTabSwipeNavigation.carbonSegmentedControl?.setWidth(self.view.frame.width / 3, forSegmentAt: 4)
        customTabSwipeNavigation.carbonSegmentedControl?.setWidth(self.view.frame.width / 3, forSegmentAt: 5)
        customTabSwipeNavigation.carbonSegmentedControl?.setWidth(self.view.frame.width / 3, forSegmentAt: 6)
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
            return self.storyboard?.instantiateViewController(withIdentifier: "NFLNEWSTableViewController") as! NFLNEWSTableViewController
        case 2:
            return self.storyboard?.instantiateViewController(withIdentifier: "NHLNEWSTableViewController") as! NHLNEWSTableViewController
        case 3:
            return self.storyboard?.instantiateViewController(withIdentifier: "BLEACHERREPORTTableViewController") as! BLEACHERREPORTTableViewController
        case 4:
            return self.storyboard?.instantiateViewController(withIdentifier: "MARCATableViewController") as! MARCATableViewController
        case 5:
             return self.storyboard?.instantiateViewController(withIdentifier: "FOOTBALITALIATableViewController") as! FOOTBALITALIATableViewController
        case 6:
            return self.storyboard?.instantiateViewController(withIdentifier: "LEQUIPETableViewController") as! LEQUIPETableViewController
        default:
            return self.storyboard?.instantiateViewController(withIdentifier: "TALKSPORTTableViewController") as! TALKSPORTTableViewController
        }
    }
    
}


