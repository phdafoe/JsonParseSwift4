//
//  MARCATableViewController.swift
//  iCoNews
//
//  Created by Andres on 24/11/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit
import PromiseKit
import Kingfisher
import APESuperHUD

class MARCATableViewController: UITableViewController {
    
    //MARK: - Variables locales
    var arrayModelMARCA : [ModelGeneralData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //LLAMADA A DATOS
        llamadaMARCA()
        //TODO: - Registro de celda
        tableView.register(UINib(nibName: "TemplateCustomCell", bundle: nil), forCellReuseIdentifier: "TemplateCustomCell")
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
        return arrayModelMARCA.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customOfertasCell = tableView.dequeueReusableCell(withIdentifier: "TemplateCustomCell", for: indexPath) as! TemplateCustomCell
        
        let model = arrayModelMARCA[indexPath.row]
        
        customOfertasCell.myNombreOferta.text = model.articles.title
        customOfertasCell.myFechaOferta.text = model.articles.publishedAt
        customOfertasCell.myInformacionOferta.text = model.articles.descripcion
        customOfertasCell.myImporteOferta.text = model.articles.author
        
        //Recuperar en background la imagen
        if let imageDes = model.articles.urlToImage, let urlDes = URL(string: imageDes){
        customOfertasCell.myImagenOferta.kf.setImage(with: ImageResource(downloadURL: urlDes),
                                                     placeholder: #imageLiteral(resourceName: "placeholder"),
                                                     options: [.transition(ImageTransition.fade(1))],
                                                     progressBlock: nil,
                                                     completionHandler: nil)
        }
        
        return customOfertasCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let webVC = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        let selectInd = tableView.indexPathForSelectedRow?.row
        let objInd = arrayModelMARCA[selectInd!]
        webVC.urlWeb = objInd.articles.url
        present(webVC, animated: true, completion: nil)
        
    }
    
    //MARK: - UTILS
    func llamadaMARCA(){
        
        let datosModelMARCA = ParserGeneral()
        let idFuente = CONSTANTES.LLAMADAS.BASE_MARCA
        
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: "Cargando", presentingView: self.view)
        
        firstly{
            return when(resolved: datosModelMARCA.getDatosFromWeb(idFuente))
            }.then{_ in
                self.arrayModelMARCA = datosModelMARCA.setParseFromWeb()
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
