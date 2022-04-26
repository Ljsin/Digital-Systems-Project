//
//  ContentView.swift
//  Analyse
//
//  Created by Lloyd Wood on 05/12/2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView {
            Discover(artist: charts[0])
                .tabItem{
                    //Home
                    Text("Home")
                    Image(systemName: "house.fill")
                }
            ArtistList()
                .tabItem{
                    //Library
                    Text("Artists")
                    Image(systemName: "music.mic.circle")
                }
            ArtistSearch(artist: artists[0])
                .tabItem{
                    //Search
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }
        }
        //SwiftUIView()
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
