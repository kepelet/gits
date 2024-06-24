//
//  PlaylistTrack.swift
//  gits
//
//  Created by Alvin Miftah on 19/06/24.
//

import Foundation

struct Playlist: Codable {
    let items: [PlaylistItem]
}

struct PlaylistItem: Codable {
    let addedAt: String
    let addedBy: User
    let isLocal: Bool
    let primaryColor: String?
    let track: Track
    let videoThumbnail: VideoThumbnail
    
    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case addedBy = "added_by"
        case isLocal = "is_local"
        case primaryColor = "primary_color"
        case track
        case videoThumbnail = "video_thumbnail"
    }
}

struct User: Codable {
    let externalUrls: ExternalURL
    let id: String
    let type: String
    let uri: String
    
    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case id
        case type
        case uri
    }
}

struct ExternalURL: Codable {
    let spotify: String
}

struct Track: Codable {
    let previewUrl: String?
    let isPlayable: Bool
    let explicit: Bool
    let type: String
    let episode: Bool
    let track: Bool
    let album: Album
    let artists: [Artist]
    let discNumber: Int
    let trackNumber: Int
    let durationMs: Int
    let externalIds: ExternalID
    let externalUrls: ExternalURL
    let id: String
    let name: String
    let popularity: Int
    let uri: String
    let isLocal: Bool
    
    enum CodingKeys: String, CodingKey {
        case previewUrl = "preview_url"
        case isPlayable = "is_playable"
        case explicit
        case type
        case episode
        case track
        case album
        case artists
        case discNumber = "disc_number"
        case trackNumber = "track_number"
        case durationMs = "duration_ms"
        case externalIds = "external_ids"
        case externalUrls = "external_urls"
        case id
        case name
        case popularity
        case uri
        case isLocal = "is_local"
    }
}

struct Album: Codable {
    let isPlayable: Bool
    let type: String
    let albumType: String
    let id: String
    let images: [AlbumImage]
    let name: String
    let releaseDate: String
    let releaseDatePrecision: String
    let uri: String
    let artists: [Artist]
    let externalUrls: ExternalURL
    let totalTracks: Int
    
    enum CodingKeys: String, CodingKey {
        case isPlayable = "is_playable"
        case type
        case albumType = "album_type"
        case id
        case images
        case name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case uri
        case artists
        case externalUrls = "external_urls"
        case totalTracks = "total_tracks"
    }
}

struct Artist: Codable {
    let externalUrls: ExternalURL
    let id: String
    let name: String
    let type: String
    let uri: String
    
    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case id
        case name
        case type
        case uri
    }
}

struct AlbumImage: Codable {
    let height: Int
    let url: String
    let width: Int
}

struct ExternalID: Codable {
    let isrc: String
}

struct VideoThumbnail: Codable {
    let url: String?
}
