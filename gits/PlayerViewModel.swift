//
//  PlayerViewModel.swift
//  gits
//
//  Created by Alvin Miftah on 24/06/24.
//

import Foundation
import AVFoundation
import Combine

class PlayerViewModel: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    
    init(audioPlayer: AVAudioPlayer? = nil, isPlaying: Bool = false) {
        self.audioPlayer = audioPlayer
        self.isPlaying = isPlaying
    }
}

final class AudioManager {
    static let shared = AudioManager()
    
    private var player: AVPlayer?
    
    private let session = AVAudioSession.sharedInstance()
    
    
    private var cancellable: AnyCancellable?
    
    deinit {
        cancellable?.cancel()
    }
    
    private init(){}
    
    func activateSession() {
        do {
            try session.setCategory(.playback, mode: .default, options: [])
        } catch _ {}
        
        do {
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch _ {}
        
        do {
            try session.overrideOutputAudioPort(.speaker)
        } catch _ {}
    }
    
    func startAudio(url: String) {
        activateSession()
        let url = URL(string: url)
        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        if let player = player {
            player.replaceCurrentItem(with: playerItem)
        } else {
            player = AVPlayer(playerItem: playerItem)
        }
        
        cancellable = NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)
                    .sink { [weak self] _ in
                        guard let me = self else { return }
                        
                        me.deactivateSession()
                    }
        
        if let player = player {
            player.play()
        }
    }
    
    func deactivateSession() {
        do {
            try session.setActive(false, options: .notifyOthersOnDeactivation)
        } catch let error as NSError {
            print("Failed to deactivate audio session: \(error.localizedDescription)")
        }
    }
    
    func play() {
            if let player = player {
                player.play()
            }
        }

    func pause() {
            if let player = player {
                player.pause()
            }
        }

    func getPlaybackDuration() -> Double {
            guard let player = player else {
                return 0
            }
         
            return player.currentItem?.duration.seconds ?? 0
        }
}
