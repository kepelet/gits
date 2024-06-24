//
//  TrackView.swift
//  gits
//
//  Created by Alvin Miftah on 20/06/24.
//

import SwiftUI

struct TrackView: View {
    let item: PlaylistItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center){
                if let url = URL(string: item.track.album.images.first?.url ?? "") {
                    AsyncImage(url: url) { image in
                        image.resizable()
                             .scaledToFill()
                             .frame(width: 50, height: 50)
                             .clipShape(.rect(cornerRadius: 10))
                             .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                }
                VStack(alignment: .leading) {
                    Text(item.track.name)
                        .font(.headline)
                    Text(item.track.album.name)
                        .font(.subheadline)
                }
                Spacer()
                VStack(alignment: .center){
                    Text("\(formatDuration(item.track.durationMs))").font(.caption2)
                }
            }
        }
    }
}
