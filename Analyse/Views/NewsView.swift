//
//  NewsView.swift
//  Analyse
//
//  Created by Lloyd Wood on 25/02/2022.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        // Allows to call model data from Artist
        List (contracts) { artist in
            ContractView(artist: artist)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
       .environment(\.colorScheme, .dark)
            
    }
}

struct ContractView: View {
    let artist: Artist
    var body: some View {
        // Geometry Reader used to create sticky header image for 1st album cover, using proxy modifiers
        GeometryReader { proxy in
            // Defining constant variables with proxy modifiers
            let minY = proxy.frame(in: .named("Scroll")).minY
            let size = proxy.size
            let height = (size.height + minY)
            VStack(alignment: .center){
                ZStack{
                    // Place 1st album cover as background image for view
                    Image(artist.imageName2)
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
                                // Placing 2nd album cover as primary image for view ontop of sticky header
                                VStack {
                                    Image(artist.imageName)
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fill)
                                        .frame(width: 160, height: 160)
                                        .clipped()
                                        .padding(.top, 12)
                                }
                                // Leading alignment for text, horizontal and bottom padding, and specific width of frame for text
                                VStack(alignment: .leading){
                                    Spacer(minLength: 20)
                                    Text("ALBUM")
                                        .font(.custom("Pt Sans", size: 10))
                                        .foregroundColor(Color.yellow)
                                        .bold()
                                    // Displays albumn in view
                                    Text(artist.album)
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.white)
                                    // Displays artist name in view
                                    Text(artist.name)
                                        .font(.system(size: 14))
                                        .foregroundColor(Color.white)
                                        .frame(width: 50, height:20)
                                
                                    // Horizontal stack for system clock image, with text alignment
                                    HStack{
                                        // Provides clock symbol
                                        Image(systemName: "clock")
                                            .resizable()
                                            .frame(width: 10, height: 10 )
                                            .foregroundColor(Color.gray)
                                        Text("Released \(artist.releaseDate)")
                                            .font(.system(size: 10))
                                            .foregroundColor(Color.gray)
                                    }
                                }
                                // padding and frame modfiers set for Text
                                .padding(.horizontal)
                                .padding(.bottom, 9)
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
        .frame(width: 420, height: 270)
        .frame(width: 380)
            // Embedded link for brief album description
            VStack {
                // Directs user to url webpage once tapped in app
                Link("\(artist.subDescription)", destination: URL(string: "https://www.rockstargames.com/newswire/article/39329ko7897a59/music-from-gta-online-the-contract-by-dr-dre-now-available")!)
                    .font(.system(size: 12))
                    .foregroundColor(.primary)
            }
        // Tracklist for the album/EP
        VStack(alignment: .leading){
            VStack{
                Text("Grand Theft Auto Online: The Contract Tracklist:")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
        }
        // Embedded Links to songs on apple music by Dr Dre.
        VStack(alignment: .leading){
            HStack {
                Text("1.")
                    .font(.system(size: 12))
                Image(artist.imageName2)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                Link("The Scenic Route", destination: URL(string: "https://embed.music.apple.com/gb/album/the-scenic-route/1608438087?i=1608438088")!)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
            }
        }
        VStack(alignment: .leading){
            HStack {
                Text("2.")
                    .font(.system(size: 12))
                Image(artist.imageName2)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                Link("The Gospel", destination: URL(string:"https://embed.music.apple.com/gb/album/gospel/1608441685?i=1608441689")!)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
            }
        }
        VStack(alignment: .leading){
            HStack {
                Text("3.")
                    .font(.system(size: 12))
                Image(artist.imageName2)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                Link("Fallin Up", destination: URL(string: "https://embed.music.apple.com/gb/album/fallin-up/1608440296?i=1608440297")!)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
            }
        }
        VStack(alignment: .leading){
            HStack {
                Text("4.")
                    .font(.system(size: 12))
                Image(artist.imageName2)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                Link("ETA", destination: URL(string: "https://embed.music.apple.com/gb/album/eta-single/1608439691")!)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
            }
        }
        VStack(alignment: .leading){
            HStack {
                Text("5.")
                    .font(.system(size: 12))
                Image(artist.imageName2)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                Link("Diamon Mind", destination: URL(string: "https://embed.music.apple.com/gb/album/diamond-mind-single/1608438844")!)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
            }
        }
        VStack(alignment: .leading){
            HStack {
                Text("6.")
                    .font(.system(size: 12))
                Image(artist.imageName2)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                Link("Black Privilege", destination: URL(string: "https://embed.music.apple.com/gb/album/black-privilege/1608441920?i=1608441922")!)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
            }
        }
        // Created for more albums by artist
        VStack(alignment: .leading){
            VStack{
                Text("More Albums by \(artist.name)")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            HStack{
                // Chronic album image and text aligned in VStack
                VStack{
                    Image(artist.imageName3)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        //.cornerRadius(10)
                    VStack(alignment: .leading){
                        Link("Compton", destination: URL(string: "https://embed.music.apple.com/gb/album/compton/1440839174")!)
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
                            Text("Released \(artist.releaseDate2)")
                                .font(.system(size: 10))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                // 2001 album image and text aligned in VStack
                VStack{
                    Image(artist.imageName4)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        //.cornerRadius(10)
                    VStack(alignment: .leading){
                        Link("2001", destination: URL(string: "https://embed.music.apple.com/gb/album/2001/1440782221")!)
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
                            Text("Released \(artist.releaseDate3)")
                                .font(.system(size: 10))
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Grand Theft Auto Online: The Contract",
                        displayMode: .inline)
    }
}
        
    

