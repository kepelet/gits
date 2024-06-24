//
//  PlaylistTrackView.swift
//  gits
//
//  Created by Alvin Miftah on 20/06/24.
//

import SwiftUI

struct PlaylistTrackView: View {
    @StateObject private var viewModel = PlaylistViewModel()
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.playlist?.items ?? [], id: \.track.id) { item in
                NavigationLink {
                    PlayerView(track: item.track)
                } label: {
                    TrackView(item: item)
                }
            }
            .navigationTitle("Playlist")
            .onAppear {
                viewModel.fetchPlaylist()
            }
        } detail: {
            Text("Track")
        }
    }
}

//#Preview {
//    PlaylistTrackView()
//}
