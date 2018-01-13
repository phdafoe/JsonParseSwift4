//
//  ISHomeMusicViewController.swift
//  iCoNews
//
//  Created by Andres on 26/11/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ISHomeMusicViewController: UIViewController {

    //MARK: - Variables locales
    var items = NSArray()
    var customTabSwipeNavigation : CarbonTabSwipeNavigation!
    
    //MARK: - IBOUTLET
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = ["MTV News", "MTV News(UK)"]
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
        customTabSwipeNavigation.setNormalColor(customColor.withAlphaComponent(0.6))
        customTabSwipeNavigation.setSelectedColor(customColor, font: UIFont.boldSystemFont(ofSize: 14))
    }
    
    
    
}

extension ISHomeMusicViewController : CarbonTabSwipeNavigationDelegate{
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        switch index {
        case 0:
            return self.storyboard?.instantiateViewController(withIdentifier: "MTVTableViewController") as! MTVTableViewController
        default:
            return self.storyboard?.instantiateViewController(withIdentifier: "MTVUKTableViewController") as! MTVUKTableViewController
        }
    }
    
}
