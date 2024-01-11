//
//  ApiConexiones.swift
//  ejemplo3AlamofireDiTema2
//
//  Created by Montacer El Fazazi on 11/01/2024.
//

import Foundation
import Alamofire

final class ApiConexiones{
    static let api = ApiConexiones()
    let BASE_URL = "https://jsonplaceholder.typicode.com"
    let estadoOk=200...299
    
    func getAlbums(success: @escaping (_ respuesta: ListaAlbums) -> (), failure: @escaping (_ error: Error?) -> ()){
        let url = "\(BASE_URL)/albums"
        
        AF.request(url, method: .get).validate(statusCode: estadoOk).responseDecodable(of: ListaAlbums.self){
            respuesta in
            if let albums = respuesta.value{
                success(albums)
            }else{
                failure(respuesta.error)
                }
            }
        }
    
    func getPhotosAlbum(idAlbum: Int, success: @escaping (_ respuesta: ListaPhotos) -> (), failure: @escaping (_ error: Error?) -> ()){
        let url = "\(BASE_URL)/photos"
        
        let parametros: Parameters = ["albumId": idAlbum] //tiene q coincidir con el nombre del json
        
        AF.request(url, method: .get, parameters: parametros).validate(statusCode: estadoOk).responseDecodable(of: ListaPhotos.self){
            respuesta in
            if let photos = respuesta.value{
                success(photos)
            }else{
                failure(respuesta.error)
            }
        }
    }
    
    func getPhotosAlbum2(idAlbum: Int, success: @escaping (_ respuesta: ListaPhotos) -> (), failure: @escaping (_ error: Error?) -> ()){
        let url = "\(BASE_URL)/albums/\(idAlbum)/photos"
        
        
        AF.request(url, method: .get).validate(statusCode: estadoOk).responseDecodable(of: ListaPhotos.self){
            respuesta in
            if let photos = respuesta.value{
                success(photos)
            }else{
                failure(respuesta.error)
            }
        }
    }
}
