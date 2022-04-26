//
//  itunesAPI.swift
//  Analyse
//
//  Created by Lloyd Wood on 11/03/2022.
//

import Foundation
import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable, Hashable{
    var trackId: Int
    var trackName: String
    var collectionName: String
    var artistName: String
    var primaryGenreName: String
    
    private var artworkUrl60: String
    var image: Image {
        Image(artworkUrl60)
    }
}

struct Response2: Codable {
    var albums: [Album]
}

struct Album: Codable {
    var artworkUrl100: String
}
