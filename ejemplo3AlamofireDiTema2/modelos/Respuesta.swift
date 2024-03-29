//
//  Respuesta.swift
//  ejemplo3AlamofireDiTema2
//
//  Created by Montacer El Fazazi on 11/01/2024.
//

import Foundation

struct Album: Decodable{
    let userId: Int //mantenemos nombres originales
    let id: Int
    let title: String
}
typealias ListaAlbums = [Album]

struct Photo: Decodable{
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

typealias ListaPhotos = [Photo]

struct NuevoAlbum: Encodable{
    let userId: Int
    let title: String
}
