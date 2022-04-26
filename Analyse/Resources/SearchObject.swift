//
//  SearchObject.swift
//  Analyse
//
//  Created by Lloyd Wood on 19/04/2022.
//

import Foundation
//creating observable object for search data 
class SearchObject: ObservableObject {
    @Published var searchText = ""
    // creating data from array
    var data: [Artist2] = []
    @Published var searchResults: [Artist2] = []
    
    init() {
        // getting data from class and function 
        data = dummyData.shared.getData()
    }
}
