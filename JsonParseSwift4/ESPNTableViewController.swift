//
//  ESPNTableViewController.swift
//  JsonParseSwift4
//
//  Created by Andres on 24/11/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit
import PromiseKit
import Kingfisher
import APESuperHUD

class ESPNTableViewController: UITableViewController {
    
    //MARK: - Variables locales
    var arrayModel : [ModelGeneralData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LLAMADA A DATOS
        llamadaESPN()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayModel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let model = arrayModel[indexPath.row]
        
        cell.textLabel?.text = model.articles.author

        return cell
    }
    

    //MARK: - UTILS
    func llamadaESPN(){
        
        let datosModel = ParserGeneral()
        let idFuente = CONSTANTES.LLAMADAS.BASE_ESPN
        
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: "Cargando", presentingView: self.view)
        
        firstly{
            return when(resolved: datosModel.getDatosFromWeb(idFuente))
            }.then{_ in
                self.arrayModel = datosModel.setParseFromWeb()
            }.then{_ in
                self.tableView.reloadData()
            }.then{_ in
                APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
            }.catch{error in
                self.present(muestraAlertVC("Lo sentimos",
                                            messageData: "Algo salió mal"),
                             animated: true,
                             completion: nil)
        }
    }

}

