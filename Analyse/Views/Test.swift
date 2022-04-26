//
//  Test.swift
//  Analyse
//
//  Created by Georgia Board on 07/03/2022.
//

import SwiftUI

struct Test: View {  enum LoadingState {
    case loading, loaded, failed
}
@State private var loadingState = LoadingState.loading
@State private var pages = [Page]()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
                Section{
                    switch loadingState {
                    case .loading:
                        Text("Loading...")
                    case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(":")
                            + Text("Page description here")
                                .italic()
                        }
                    case .failed:
                        Text("Please try againb later")
                    }
                }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
