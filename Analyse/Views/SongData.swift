//
//  SongData.swift
//  Analyse
//
//  Created by Lloyd Wood on 14/04/2022.
//

import SwiftUI

struct SongData: View {
    @State private var results = [Result]()
    let artist: Artist2
    var body: some View {
        Form{
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                    Text(item.artistName + " - " + item.collectionName)
                        .font(.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundColor(.secondary)
                    }
                }
            }.task {
                await songData()
        }
        .navigationBarTitle("Songs by \(artist.name)", displayMode: .inline)
    }

    func songData() async {
        // gaining access to data from iTunes api url string
        guard let url = URL(string:
                                artist.iTunesUrl) else {
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
}


struct SongData_Previews: PreviewProvider {
    static var previews: some View {
        SongData(artist: artists[0])
    }
}
