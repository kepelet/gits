//
//  PlaylistTrackViewModel.swift
//  gits
//
//  Created by Alvin Miftah on 19/06/24.
//

import Foundation
import Combine

class PlaylistViewModel: ObservableObject {
    @Published var playlist: Playlist?
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPlaylist() {
        if let url = Bundle.main.url(forResource: "PlaylistTrack", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let playlist = try JSONDecoder().decode(Playlist.self, from: data)
                DispatchQueue.main.async {
                    self.playlist = playlist
                }
            } catch {
                print("Error loading local JSON file: \(error)")
            }
        }
    }
}

