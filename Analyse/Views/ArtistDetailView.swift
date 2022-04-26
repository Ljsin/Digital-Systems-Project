//
//  ArtistDetailView.swift
//  Analyse
//
//  Created by Lloyd Wood on 14/03/2022.
//

import SwiftUI

struct ArtistDetailView: View {
    var body: some View {
        DetailView(artist: artists[0])
            
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView()
            .environment(\.colorScheme, .dark)
    }
}

struct DetailView: View {
    enum LoadingState {
        case loading, loaded, failed
    }
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    @State private var results = [Result]()
    @State var isViewAllImageTapped = false
    let artist: Artist2
    var body: some View {
        Form{
            // Geometry Reader used to create sticky header image for 1st album cover, using proxy settings
            GeometryReader { geo in
                // Defining constant variables with geometry settings
                let minY = geo.frame(in: .named("Scroll")).minY
                let size = geo.size
                let height = (size.height + minY)
                VStack(alignment: .leading){
                    ZStack{
                        // Place 1st album cover as background image for view
                        Image(artist.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: height, alignment: .top)
                            .clipped()
                            .padding(.top, 55)
                            // Overlay content with gradient colours for background image
                            .overlay(content: {
                                ZStack {
                                    // Creating a linear gradient from two types of colours with a set opacity for image
                                    LinearGradient(colors:[
                                        .clear,
                                        .black.opacity(0.92)
                                    ],startPoint: .top, endPoint: .bottom)
                                    // Leading alignment for text, horizontal and bottom padding, and specific width of frame for text
                                    VStack(alignment: .leading, spacing: 12){
                                       Spacer()
                                        Text("ARTIST")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                        HStack(alignment: .bottom, spacing: 10){
                                            Text(artist.name)
                                                .font(.title2)
                                                .foregroundColor(Color.white)
                                        }
                                    }
                                    // padding and frame modfiers set for Text
                                    .padding(.horizontal)
                                    .padding(.bottom, 55)
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                }
                            })
                            // Defined corner radius of sticky header image
                            // offset axis y set to -minY
                            .cornerRadius(10)
                            .offset(y: -minY)
                    }
                }
            }
            .frame(width: 420, height: 240)
            .frame(width: 380)
            VStack(alignment: .leading){
                // creating a switch and case state to load wikipedia data from WikiModel
                Section() {
                    switch loadingState {
                    case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            VStack(alignment: .leading){
                                Text("description:")
                                    .font(.system(size: 14))
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                                
                                Text(page.title)
                                    .font(.system(size: 14))
                                + Text(": ") +
                                  Text(page.extract)
                                    .font(.system(size: 14))
                                    .italic()
                            }
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
            // Created for more albums by artist
            VStack(alignment: .leading){
                VStack{
                    Text("Essential Album")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                HStack(spacing: 15){
                    // Chronic album image and text aligned in VStack
                    VStack(alignment: .leading){
                        Image(artist.album)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            //.cornerRadius(10)
                        VStack(alignment: .leading){
                            Link("\(artist.albumName)", destination: URL(string: artist.albumUrl)!)
                                .font(.system(size: 10))
                                .foregroundColor(.primary)
                            Spacer()
                            Text(artist.name)
                                .font(.system(size: 12))
                            Spacer()
                            HStack{
                                // provides clock symbol
                                Image(systemName: "clock")
                                    .resizable()
                                    .frame(width: 10, height: 10 )
                                Text("Released \(artist.Released)")
                                    .font(.system(size: 10))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                Spacer(minLength: 15)
            }
            VStack(alignment: .leading) {
                Text("View songs by \(artist.name)")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                // creating a navigation link to artist song data 
                NavigationLink(destination: SongData(artist: artist)) {
                    ArtistView(artist: artist)
                }
            }
        }.task {
            await WikiData()
       }
        .navigationBarTitle(artist.name, displayMode: .inline)
    }
    func WikiData() async {
        // gaining access to data from Wikipedia api url string
        guard let url = URL(string: artist.wikiurl) else {
            print("Error Bad URL")
            return
        }
        // data returns url instance containing data its found from wikipedia api in try and await clause
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // Getting some data back from the decoder
            if let decodedItems = try? JSONDecoder().decode(WikiResult.self, from: data){
                // Converting the array values to our pages array in WikiModel
                pages = decodedItems.query.pages.values.sorted { $0.title < $1.title }
                loadingState = .loaded
            }
        } catch {
            // If the loading state has failed the request will not be made
            loadingState = .failed
        }
    }
}

