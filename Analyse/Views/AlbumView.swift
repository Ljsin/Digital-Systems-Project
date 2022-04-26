//
//  SwiftUIView.swift
//  Analyse
//
//  Created by Lloyd Wood on 07/03/2022.
//

import SwiftUI

struct AlbumView: View {
    var body: some View {
        // Allows to call model data from Artist
        MMLPView(artist: artists[0])
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
       .environment(\.colorScheme, .dark)
            
    }
}

struct MMLPView: View {
    enum LoadingState {
        case loading, loaded, failed
    }
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    @State private var results = [Result]()
    let artist: Artist2
    var body: some View {
        Form {
            // Geometry Reader used to create sticky header image for 1st album cover, using proxy settings
            GeometryReader { proxy in
                // Defining constant variables with proxy settings
                let minY = proxy.frame(in: .named("Scroll")).minY
                let size = proxy.size
                let height = (size.height + minY)
                VStack(alignment: .center){
                    ZStack{
                        // Place 1st album cover as background image for view
                        Image(artist.album)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: height, alignment: .center)
                            .clipped()
                            .padding(.top, 12)
                            .opacity(0.7)
                            // Overlay content with gradient colours for background image
                            .overlay(content: {
                                ZStack {
                                    // Creating a linear gradient from two types of colours with a set opacity for image
                                    LinearGradient(colors:[
                                        .clear,
                                        .black.opacity(0.9)
                                    ],startPoint: .top, endPoint: .bottom)
                                    VStack {
                                        Image(artist.album)
                                            .resizable()
                                            .aspectRatio(1, contentMode: .fill)
                                            .frame(width: 160, height: 160)
                                            .clipped()
                                            .padding(.top, 30)
                                    }
                                    // Leading alignment for text, horizontal and bottom padding, and specific width of frame for text
                                    VStack(alignment: .center, spacing: 0){
                                        Spacer(minLength: 20)
                                        // Displays albumn in view
                                        Text(artist.albumName)
                                            .font(.system(size: 14))
                                            .foregroundColor(Color.white)
                                        // Displays artist name in view
                                        Text(artist.name)
                                            .font(.system(size: 12))
                                            .foregroundColor(Color.red)
                                            .frame(width: 90, height:20)
                                    
                                        // Horizontal stack for system clock image, with text alignment
                                        HStack{
                                            // Provides clock symbol
                                            Image(systemName: "clock")
                                                .resizable()
                                                .frame(width: 10, height: 10 )
                                                .foregroundColor(Color.gray)
                                            Text("HIP-HOP/RAP")
                                                .font(.system(size: 10))
                                                .foregroundColor(Color.gray)
                                        }
                                    }
                                    // padding and frame modfiers set for Text
                                    .padding(.bottom, 20)
                                    .frame(alignment: .center)
                                }
                            })
                            // offset axis y set to -minY
                            .offset(y: -minY)
                    }
                }
                .navigationBarTitle("Albums", displayMode: .inline)
            }
            .frame(width: 420, height: 270)
            .frame(width: 380)
                VStack(alignment: .leading){
                    // creating a switch and case state to load wikipedia data from WikiModel
                    Section() {
                        switch loadingState {
                        case .loaded:
                            ForEach(pages, id: \.pageid) { page in
                                Text(page.title)
                                    .font(.system(size: 15))
                                + Text(": ") +
                                Text(page.extract)
                                    .font(.system(size: 15))
                                    .italic()
                            }
                            // loading state initiates once live preview is ran
                        case .loading:
                            Text("Loading…")
                            // if loading state has failed display error message
                        case .failed:
                            Text("Error loading failed.")
                        }
                    }
                }
            VStack(alignment: .leading) {
                Text("Album Tracklist")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    HStack {
                        Image(artist.album)
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .leading)
                        Text(item.trackName)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                        }
                    }
                }
            }.task {
                await songData()
                await WikiData()
            }
        }
        func songData() async {
            // gaining access to data from iTunes api url string
            guard let url = URL(string:
                                    "https://itunes.apple.com/search?term=long+live+the+kane&albumTerm&entity=song&limit=10") else {
                print("Invalid URL")
                return
            }
            do {
                // data returns url instance containing data its found from iTunes api
                let (data, _) = try await URLSession.shared.data(from: url)
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        results = decodedResponse.results
                    }
                }
            } catch {
                print("Invalid data")
            }
        }
        func WikiData() async {
            // gaining access to data from Wikipedia api url string
            guard let url = URL(string: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=510&titles=Long_Live_the_Kane") else {
                print("Error Bad URL")
                return
            }
            // data returns url instance containing data its found from wikipedia api in try and await clause
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                // Getting some data back from the decoder
               if let decodedItems = try? JSONDecoder().decode(WikiResult.self, from: data) {
                    // Converting the array values to our pages array in WikiModel
                    pages = decodedItems.query.pages.values.sorted { $0.title < $1.title }
                    loadingState = .loaded
                }
            } catch {
                // If the loading state has failed the request will not be made
                loadingState = .failed
            }
        }
    
   /* func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=eminem&media=music&limit=10") else {
            print("Invalid API endpoint")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, decodedResponse, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        results =  decodedResponse.results
                    }
                    return
                }
            }
        }.resume()
    }*/
}
