//
//  ArtistList.swift
//  Analyse
//
//  Created by Lloyd Wood on 01/03/2022.
//

import SwiftUI

struct ArtistList: View {
    var body: some View {
        NavigationView{
            List (artists) { artist in
                NavigationLink(destination: DetailView(artist: artist)) {
                    ArtistView(artist: artist)
                    
                }
            }
        }
    }
}

struct ArtistList_Previews: PreviewProvider {
    static var previews: some View {
        ArtistList()
           .environment(\.colorScheme, .dark)
    }
}

struct ArtistView: View {
    let artist: Artist2
    var body: some View {
        HStack {
            Image(artist.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 45)
                .frame(width: 45)
                .clipShape(Circle())
        
        VStack(alignment: .leading){
            Text(artist.name)
                .font(.system(size: 14))
            }
        }
        .navigationBarTitle("Artists")
        
    }
}

