//
//  TimeConterter.swift
//  gits
//
//  Created by Alvin Miftah on 20/06/24.
//

import Foundation

extension TimeInterval {
    var seconds: Int {
        return Int(self.rounded())
    }
}

func formatDuration(_ durationMs: Int) -> String {
    let totalSeconds = durationMs / 1000
    let minutes = totalSeconds / 60
    let seconds = totalSeconds % 60
    return String(format: "%02d:%02d", minutes, seconds)
}
