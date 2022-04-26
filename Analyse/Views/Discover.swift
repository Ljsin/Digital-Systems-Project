//
//  Discover.swift
//  Analyse
//
//  Created by Lloyd Wood on 03/02/2022.
//

import SwiftUI

struct Discover: View {
    @Environment(\.colorScheme) var colorScheme
        
    var numOfImages = 4
    // creating timer that goes off every 3 seconds for image animation 
    let timer = Timer.publish(every: 3,
    on: .main, in: .common).autoconnect()
    
    @State  var Index = 0
    @State var isViewAllImageTapped = false
    @State var isViewAllImageTapped2 = false
    @State var isViewAllImageTapped3 = false
    @State var isViewAllImageTapped4 = false
    @State var isViewAllImageTapped5 = false
    @State var isViewAllImageTapped6 = false
    let artist: Charts
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    //Featured Artists
                    Text("Featured Artists").font(.custom("PT Sans Regular", size: 18))
                        .padding(.leading)
                    // Geometry reader and Tab view to create smooth animation effect
                    GeometryReader { proxy in
                        TabView(selection: $Index) {
                        ForEach (0..<numOfImages) { num in
                            Image("\(num)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                .tag(num)
                        }
                    }.tabViewStyle(PageTabViewStyle())
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                        // Setting width to proxy setting and height manually
                            .frame(width: proxy.size.width,
                                   height: 220)
                            .frame(height: 190) // sets height of image within frame
                            .onReceive(timer, perform: { _ in
                                withAnimation {
                                    //sets page to become next image by incrementation
                                Index = Index < numOfImages
                                ? Index + 1 : 0
                                }
                            })
                    }
                }
                Spacer(minLength: 210)
                VStack {
                    VStack(alignment: .leading) {
                        //News
                        HStack(spacing: 0) {
                            Text("NEWS")
                                .font(.custom("Prociono Regular", size: 14))
                            .padding(.leading)
                            VStack {
                                Divider().background(Color.white)
                                    .padding(.horizontal, 15)
                            }
                        }
                        Spacer(minLength:10)
                        // Button that directs user to the news view upon tap
                        Button(action: {}) {
                            HStack {
                                // image set with modifiers
                                Spacer(minLength: 7)
                                Image("The Contract")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 365)
                                    .clipped()
                                    .cornerRadius(10)
                                    // on tap gesture used for on tap toggle animation
                                    .onTapGesture {
                                        withAnimation(.easeInOut){
                                            isViewAllImageTapped.toggle()
                                        }
                                    }
                                    NavigationLink("", destination: NewsView(), isActive: $isViewAllImageTapped)
                            }
                        }
                        Spacer(minLength: 10)
                        
                        //Dr Dre’s The Contract Rele...
                        Text("Dr. Dre Releases The Contract for Rockstar Games Grand Theft Auto Online DLC.")
                            .font(.system(size: 16))
                            .fontWeight(.light)
                            .padding(.leading)
                    }
                    Spacer(minLength: 50)
                    VStack{
                        Text("CHARTS").font(.custom("Prociono Regular", size: 18))
                        Text("Trending Artists").font(.custom("Prociono Regular", size: 14))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.13, blue: 0.29, alpha: 1)))
                    }
                }
                //Charts
                VStack(alignment: .leading){
                    //Eminem
                    HStack {
                        VStack {
                            Text("1")
                                .padding(.leading)
                        }
                        // Button that directs user to Eminems artist page
                        Button(action: {}) {
                            // Image called upon it's index with set modifiers
                            ForEach(4..<5, id:\.self) { index in
                                Image("\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 44)
                                .frame(width: 65, alignment: .leading)
                                .clipped()
                                .cornerRadius(5)
                            }
                            // on tap gesture used for on tap toggle animation
                                .onTapGesture {
                                    withAnimation(.easeInOut){
                                        isViewAllImageTapped2.toggle()
                                    }
                                }
                            NavigationLink("", destination: DetailView(artist: artists[4]), isActive: $isViewAllImageTapped2)
                        }
                        VStack(alignment: .leading){
                            Text(artist.name)
                                .font(.system(size: 14))
                            Text("Music To Be Murderd By")
                                .foregroundColor(.secondary)
                                .font(.system(size: 12))
                        }
                    }
                    Divider().background(Color.white)
                        .padding(.horizontal, 0)
                    
                    //Skylar Grey
                    HStack {
                        VStack {
                            Text("2")
                                .padding(.leading)
                        }
                        // Button that directs user to Skylar greys artist page
                        Button(action: {}) {
                            // Image called upon it's index with set modifiers
                            ForEach(5..<6, id:\.self) { index in
                                Image("\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 44)
                                .frame(width: 65, alignment: .leading)
                                .clipped()
                                .cornerRadius(5)
                            }
                            // on tap gesture used for on tap ease in and out animation
                                .onTapGesture {
                                    withAnimation(.easeInOut){
                                        isViewAllImageTapped3.toggle()
                                    }
                                }
                            NavigationLink("", destination: DetailView(artist: artists[17]), isActive: $isViewAllImageTapped3)
                        }
                        VStack(alignment: .leading){
                            Text("Skylar Grey")
                                .font(.system(size: 14))
                            Text("Natural Causes")
                                .foregroundColor(.secondary)
                                .font(.system(size: 12))
                        }
                    }
                    Divider().background(Color.white)
                        .padding(.horizontal, 0)
                
                    // Dr Dre
                    HStack {
                        VStack {
                            Text("3")
                                .padding(.leading)
                        }
                        // Button that directs user to Dr Dre's artist page
                        Button(action: {}) {
                            // Image called upon it's index with set modifiers
                            ForEach(6..<7, id:\.self) { index in
                                Image("\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 44)
                                .frame(width: 65, alignment: .leading)
                                .clipped()
                                .cornerRadius(5)
                            }
                            // on tap gesture used for on tap toggle animation
                                .onTapGesture {
                                    withAnimation(.easeInOut){
                                        isViewAllImageTapped4.toggle()
                                    }
                                }
                            NavigationLink("", destination: DetailView(artist: artists[2]), isActive: $isViewAllImageTapped4)
                        }
                        VStack(alignment: .leading){
                            Text("Dr Dre")
                                .font(.system(size: 14))
                            Text("The Chornic: 2001")
                                .foregroundColor(.secondary)
                                .font(.system(size: 12))
                        }
                    }
                    Divider().background(Color.white)
                        .padding(.horizontal, 0)
                    
                    //50 Cent
                    HStack {
                        VStack {
                            Text("4")
                                .padding(.leading)
                        }
                        // Button that directs user to 50 Cents artist page
                        Button(action: {}) {
                            // Image called upon it's index with set modifiers
                            ForEach(7..<8, id:\.self) { index in
                                Image("\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 44)
                                .frame(width: 65, alignment: .leading)
                                .clipped()
                                .cornerRadius(5)
                            }
                            // on tap gesture used for on tap toggle animation
                                .onTapGesture {
                                    withAnimation(.easeInOut){
                                        isViewAllImageTapped5.toggle()
                                    }
                                }
                            NavigationLink("", destination: DetailView(artist: artists[18]), isActive: $isViewAllImageTapped5)
                        }
                        VStack(alignment: .leading){
                            Text("50 Cent")
                                .font(.system(size: 14))
                            Text("Get Rich or Die Tryin'")
                                .foregroundColor(.secondary)
                                .font(.system(size: 12))
                        }
                    }
                    Divider().background(Color.white)
                        .padding(.horizontal, 0)
                    
                    // Ed Sheeran
                    HStack {
                        VStack {
                            Text("5")
                                .padding(.leading)
                        }
                        // Button that directs user to Ed Sheerans artist page
                        Button(action: {}) {
                            // Image called upon it's index with set modifiers
                            ForEach(8..<9, id:\.self) { index in
                                Image("\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 44)
                                .frame(width: 65, alignment: .leading)
                                .clipped()
                                .cornerRadius(5)
                            }
                            // on tap gesture used for on tap toggle animation
                                .onTapGesture {
                                    withAnimation(.easeInOut){
                                        isViewAllImageTapped6.toggle()
                                    }
                                }
                            NavigationLink("", destination: DetailView(artist: artists[3]), isActive: $isViewAllImageTapped6)
                        }
                        VStack(alignment: .leading){
                            Text("Ed Sheeran")
                                .font(.system(size: 14))
                            Text("Divide")
                                .foregroundColor(.secondary)
                                .font(.system(size: 12))
                        }
                    }
                    Divider().background(Color.white)
                        .padding(.horizontal, 0)
                }
            }
            .navigationTitle("Discover")
        }
    }

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover(artist: charts[0])
        .environment(\.colorScheme, .dark)
            
    }
  }
}
