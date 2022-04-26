//
//  DummyData.swift
//  Analyse
//
//  Created by Lloyd Wood on 19/04/2022.
//

import Foundation

class dummyData {
    public static let shared = dummyData()
    
    func getData() -> [Artist2] {
        return [
            Artist2(name: "Big Daddy Kane", imageName: "Big Daddy Kane", album: "LongLiveKane", albumName: "Long Live The Kane",
                    albumUrl: "https://embed.music.apple.com/gb/album/long-live-the-kane/442164816",
                    iTunesUrl: "https://itunes.apple.com/search?term=big+daddy+kane&artistTerm&entity=song&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=675&titles=Big_Daddy_Kane", Released: "1988"),
            
            Artist2(name: "Biggie Smalls", imageName: "Biggie Smalls", album: "Ready To Die", albumName: "Ready To Die",
                    albumUrl: "https://embed.music.apple.com/gb/album/ready-to-die-the-remaster/204669326",
                    iTunesUrl: "https://itunes.apple.com/search?term=the+notorious+big&artistTerm&entity=song&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=645&titles=The_Notorious_B.I.G.", Released: "2004"),
            
            Artist2(name: "Dr. Dre", imageName: "Dr Dre", album: "2001", albumName: "2001",
                    albumUrl: "https://embed.music.apple.com/gb/album/2001/1440782221",
                    iTunesUrl: "https://itunes.apple.com/search?term=dr+dre&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=625&titles=Dr._Dre", Released: "1999"),
            
            Artist2(name: "Ed Sheeran", imageName: "Ed Sheeran", album: "Divide", albumName: "Divide",
                    albumUrl: "https://embed.music.apple.com/gb/album/deluxe/1193682944",
                    iTunesUrl: "https://itunes.apple.com/search?term=ed+sheeran&artistTerm&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=600&titles=Ed_Sheeran", Released: "2017"),
            
            Artist2(name: "Eminem", imageName: "Eminem2", album: "MMLP", albumName: "The Marshall Mathers LP",
                    albumUrl: "https://embed.music.apple.com/gb/album/the-marshall-mathers-lp/1440866782",
                    iTunesUrl: "https://itunes.apple.com/search?term=eminem&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=635&titles=Eminem", Released: "2000"),
            
            Artist2(name: "EPMD", imageName: "epmd", album: "Stricly Business", albumName: "Stricly Business",
                    albumUrl: "https://embed.music.apple.com/gb/album/strictly-business/721248274",
                    iTunesUrl: "https://itunes.apple.com/search?term=epmd&attribute=artistTerm&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=680&titles=EPMD", Released: "1988"),
            
            Artist2(name: "Hopsin", imageName: "Hopsin", album: "No Shame", albumName: "No Shame",
                    albumUrl: "https://embed.music.apple.com/gb/album/no-shame/1493444849",
                    iTunesUrl: "https://itunes.apple.com/search?term=hopsin&attribute=artistTerm&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=645&titles=hopsin", Released: "2017"),
            
            Artist2(name: "Imagine Dragons", imageName: "Imagine_dragons", album: "Night Visions", albumName: "Night Visions",
                    albumUrl: "https://embed.music.apple.com/gb/album/night-visions-deluxe/1440860487",
                    iTunesUrl: "https://itunes.apple.com/search?term=imagine_dragons&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=645&titles=Imagine_Dragons", Released: "2012"),
            
            Artist2(name: "Kendrick Lamar", imageName: "Kendrick Lamar", album: "DAMN", albumName: "DAMN",
                    albumUrl: "https://embed.music.apple.com/gb/album/damn/1440881047",
                    iTunesUrl: "https://itunes.apple.com/search?term=kendrick_lamar&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=645&titles=Kendrick_Lamar", Released: "2017"),
            
            Artist2(name: "Kid Cudi", imageName: "Kid_cudi", album: "Man on The Moon", albumName: "Man On The Moon",
                    albumUrl: "https://embed.music.apple.com/gb/album/man-on-the-moon-the-end-of-day-expanded-version/1445846640",
                    iTunesUrl: "https://itunes.apple.com/search?term=kid_cudi&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=680&titles=Kid_Cudi", Released: "2009"),
            
            Artist2(name: "LL Cool J", imageName: "ll_cool_j", album: "Radio", albumName: "Radio",
                    albumUrl: "https://embed.music.apple.com/gb/album/radio/1443530975",
                    iTunesUrl: "https://itunes.apple.com/search?term=ll_cool_j&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=645&titles=LL_Cool_J", Released: "1985"),
            
            Artist2(name: "Matt Maeson", imageName: "Matt Maeson", album: "Bank on The Funeral", albumName: "Bank on The Funeral",
                    albumUrl: "https://embed.music.apple.com/gb/album/bank-on-the-funeral/1457314241",
                    iTunesUrl: "https://itunes.apple.com/search?term=matt_maeson&entity=song&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=600&titles=Matt_Maeson", Released: "2019"),
            
            Artist2(name: "Nas", imageName: "Nas", album: "Illmatic", albumName: "Illmatic",
                    albumUrl: "https://embed.music.apple.com/gb/album/illmatic/662324135",
                    iTunesUrl: "https://itunes.apple.com/search?term=nas&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=665&titles=Nas", Released: "1994"),
            
            Artist2(name: "Obie Trice", imageName: "obie-trice", album: "Cheers", albumName: "Cheers",
                    albumUrl: "https://embed.music.apple.com/gb/album/cheers-uk-version/1443300859",
                    iTunesUrl: "https://itunes.apple.com/search?term=obie_trice&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=645&titles=Obie_Trice", Released: "2003"),
            
            Artist2(name: "Proof", imageName: "proof", album: "Grown Man Sh!t", albumName: "Grown Man Sh!t",
                    albumUrl: "https://embed.music.apple.com/gb/album/big-proof-grown-man-sh-t/413715596",
                    iTunesUrl: "https://itunes.apple.com/search?term=big_proof&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=635&titles=Proof_(rapper)", Released: "2011"),
            
            Artist2(name: "Redman", imageName: "Redman", album: "What Thee", albumName: "What Thee",
                    albumUrl: "https://embed.music.apple.com/gb/album/whut-thee-album/1440921502",
                    iTunesUrl: "https://itunes.apple.com/search?term=redman&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=627&titles=Redman_(rapper)", Released: "1992"),
            
            Artist2(name: "Run-DMC", imageName: "Run-DMC", album: "Raising Hell", albumName: "Raising Hell",
                    albumUrl: "https://embed.music.apple.com/gb/album/raising-hell/254344779",
                    iTunesUrl: "https://itunes.apple.com/search?term=run_dmc&entity=song&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=601&titles=Run-DMC", Released: "1986"),
            
            Artist2(name: "Skylar Grey", imageName: "SkylarGrey", album: "Natural Causes", albumName: "Natural Causes",
                    albumUrl: "https://embed.music.apple.com/gb/album/natural-causes/1440883222",
                    iTunesUrl: "https://itunes.apple.com/search?term=skylar_grey&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=670&titles=Skylar_Grey", Released: "2016"),
            
            Artist2(name: "50 Cent", imageName: "50 Cent", album: "Get Rich or Die Tryin", albumName: "Get Rich or Die Tryin",
                    albumUrl: "https://embed.music.apple.com/gb/album/get-rich-or-die-tryin/1440796266",
                    iTunesUrl: "https://itunes.apple.com/search?term=50_cent&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=645&titles=50_Cent", Released: "2003"),
            
            Artist2(name: "2Pac", imageName: "2Pac", album: "All Eyez on Me", albumName: "All Eyez On Me",
                    albumUrl: "https://embed.music.apple.com/gb/album/all-eyez-on-me/1588480719",
                    iTunesUrl: "https://itunes.apple.com/search?term=2pac&media=music&limit=100",
                    wikiurl: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=false&exchars=645&titles=Tupac_Shakur", Released: "1996"),
        ]
    }
}
