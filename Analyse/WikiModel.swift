//
//  WikiModel.swift
//  Analyse
//
//  Created by Lloyd Wood on 31/03/2022.
//

import Foundation
import SwiftUI

struct WikiResult: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    //let description: String
    let title: String
    let extract: String
}
