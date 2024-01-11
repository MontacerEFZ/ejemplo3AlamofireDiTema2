//
//  ViewController.swift
//  ejemplo3AlamofireDiTema2
//
//  Created by Montacer El Fazazi on 11/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbRespuestaPhotoAlbum: UILabel!
    @IBOutlet weak var textIdAlbum: UITextField!
    @IBOutlet weak var cargando: UIActivityIndicatorView!
    @IBOutlet weak var lbResultadoListAlbums: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cargando.hidesWhenStopped = true
        cargando.stopAnimating()
            }

    @IBAction func btnGetAlbums(_ sender: Any) {
        cargando.startAnimating()
        ApiConexiones.api.getAlbums(){
            respuesta in
            self.cargando.stopAnimating()
            self.lbResultadoListAlbums.text = "Total Albums: \(respuesta.count)"
        }failure: {
            error in
            self.cargando.stopAnimating()
            self.lbResultadoListAlbums.text = error.debugDescription
        }
    }
    
    @IBAction func btnGetPhotos(_ sender: Any) {
        cargando.startAnimating()
        let idAlbum: Int = Int(textIdAlbum.text!)!
        
        ApiConexiones.api.getPhotosAlbum(idAlbum: idAlbum){
            respuesta in
            self.cargando.stopAnimating()
            self.lbRespuestaPhotoAlbum.text = "total fotos: \(respuesta.count)"
        }failure: {
            error in
            self.cargando.stopAnimating()
            self.lbRespuestaPhotoAlbum.text = error.debugDescription
        }
                                        
    }
    
}

