//
//  PlayerView.swift
//  gits
//
//  Created by Alvin Miftah on 22/06/24.
//

import SwiftUI

struct PlayerView: View {
    var track: Track
    var body: some View {
        ZStack {
            Color(hex: "#005C78").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                AsyncImage(url: URL(string: track.album.images[0].url)!){ image in
                    image.image?.resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 220, alignment: .center)
                }
                Text(track.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title2).foregroundStyle(Color(hex: "#F3F7EC"))
                Text(track.artists[0].name).foregroundStyle(Color(hex: "#F3F7EC"))
                HStack(alignment: .center) {
                    Button {
                        play()
                    } label: {
                        Image(systemName: "backward.end.circle.fill").resizable().scaledToFit().frame(width: 30, height: 30)
                    }.background(.white).cornerRadius(.infinity).controlSize(.extraLarge)
                    
                    Button {
                        play()
                    } label: {
                        Image(systemName: "play.circle.fill").resizable().scaledToFit().frame(width: 50, height: 50)
                    }.background(.white).cornerRadius(.infinity).controlSize(.extraLarge)
                    
                    Button {
                        play()
                    } label: {
                        Image(systemName: "forward.end.circle.fill").resizable().scaledToFit().frame(width: 30, height: 30)
                    }.background(.white).cornerRadius(.infinity).controlSize(.extraLarge)
                }.foregroundColor(Color(hex: "#E88D67"))
            }
            
        }
    }
    
    func play(){
        print("uri : \(track.externalUrls.spotify)")
        AudioManager.shared.startAudio(url: track.externalUrls.spotify)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let mockTrack = Track(
            previewUrl: "https://p.scdn.co/mp3-preview/xyz",
            isPlayable: true,
            explicit: false,
            type: "track",
            episode: false,
            track: true,
            album: Album(
                isPlayable: true,
                type: "album",
                albumType: "album",
                id: "1",
                images: [AlbumImage(height: 640, url: "https://i.scdn.co/image/ab67616d0000b273e8a1e52b8c83e49f76e4d6ae", width: 640)],
                name: "Album Name",
                releaseDate: "2020-01-01",
                releaseDatePrecision: "day",
                uri: "spotify:album:1",
                artists: [Artist(externalUrls: ExternalURL(spotify: "https://open.spotify.com/artist/1"), id: "1", name: "Artist Name", type: "artist", uri: "spotify:artist:1")],
                externalUrls: ExternalURL(spotify: "https://open.spotify.com/album/1"),
                totalTracks: 10
            ),
            artists: [Artist(externalUrls: ExternalURL(spotify: "https://open.spotify.com/artist/1"), id: "1", name: "Artist Name", type: "artist", uri: "spotify:artist:1")],
            discNumber: 1,
            trackNumber: 1,
            durationMs: 180000,
            externalIds: ExternalID(isrc: "USRC17607839"),
            externalUrls: ExternalURL(spotify: "https://open.spotify.com/track/1"),
            id: "1",
            name: "Track Name",
            popularity: 50,
            uri: "spotify:track:1",
            isLocal: false
        )
        
        PlayerView(track: mockTrack)
    }
}
