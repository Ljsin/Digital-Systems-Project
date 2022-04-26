//
//  WikiTest.swift
//  Analyse
//
//  Created by Georgia Board on 31/03/2022.
//

import SwiftUI

struct WikiTest: View {
    enum LoadingState {
        case loading, loaded, failed
    }
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    var body: some View {
        NavigationView{
            Form{
                Section() {
                    switch loadingState {
                    case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .font(.system(size: 15))
                                
                                
                        }
                    case .loading:
                        Text("Loading…")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }.task {
                await WikiData()
            }
        }
    }
    func WikiData() async {
        // gaining access to data from Wikipedia api url string
        guard let url = URL(string: "https://en.wikipedia.org/w/api.php?action=query&format=json&prop=description&titles=Nas") else {
            print("Error Bad URL")
            return
        }
        // data returns url instance containing data its found from wikipedia api in try and await clause
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // Getting some data back from the decoder
            let decodedItems = try JSONDecoder().decode(WikiResult.self, from: data)

            // Converting the array values to our pages array in WikiModel
            pages = decodedItems.query.pages.values.sorted { $0.title < $1.title }
            loadingState = .loaded
        } catch {
            // if we're still here it means the request failed somehow
            loadingState = .failed
        }
    }
}


struct WikiTest_Previews: PreviewProvider {
    static var previews: some View {
        WikiTest()
    }
}
