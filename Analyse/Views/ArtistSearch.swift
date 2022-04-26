//
//  ArtistSearch.swift
//  Analyse
//
//  Created by Lloyd Wood on 19/04/2022.
//

import SwiftUI

struct ArtistSearch: View {
    @StateObject var model = SearchObject()
    @State private var isPresenting = false
    @State private var searchQuery = ""
    let artist: Artist2
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                // getting the correct search result and displaying correct content from detail view
                ForEach(model.searchResults) { artist in
                    NavigationLink(destination: DetailView(artist: artist), isActive: $isPresenting) {
                    }
                }
                Image(systemName: "music.note.list")
                .font(.system(size: 50))
                .padding(.bottom)
                Text("Find an artist")
                    .font(.title.weight(.bold))
                Text("Start searching for your artist")
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.gray)
            .navigationTitle("Search")
            
            // shows search suggestions for artists
            .searchable(text: $searchQuery, placement: .automatic, prompt: "Search for an artist") {
                // getting the correct search result from model data
                ForEach(model.searchResults) { artist in
                    // if view exists present the content from initial call
                    Button { isPresenting = true } label : {
                        ArtistView(artist: artist)
                            .foregroundColor(.primary)
                    }
                    
                }
            }
            // search results change when new values are input
            .onChange(of: searchQuery) { searchTerm in
                // filters search results based on artist name 
                model.searchResults = model.data.filter({ artist in
                    artist.name.contains(searchTerm)
                })
            }
        }
    }
}

struct ArtistSearch_Previews: PreviewProvider {
    static var previews: some View {
        ArtistSearch(artist: artists[0])
    }
}
