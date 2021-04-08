//
//  Extension+AVPlayerItem.swift
//  MusicApp
//
//  Created by MyeongJin on 2021/04/07.
//

import AVFoundation
import UIKit

extension AVPlayerItem {
    func converToTrack() -> Track? {
        let metadataList = asset.metadata
        
        var trackTitle:     String?
        var trackArtist:    String?
        var trackAlbumName: String?
        var trackArtwork:   UIImage?
        
        for metadata in metadataList {
            if let title = metadata.title {
                trackTitle = title
            }
            
            if let artist = metadata.artist {
                trackArtist = artist
            }
            
            if let albumName = metadata.albumName {
                trackAlbumName = albumName
            }
            
            if let artwork = metadata.artwork {
                trackArtwork = artwork
            }
        }
        
        guard let title = trackTitle,
              let artist = trackArtist,
              let albumName = trackAlbumName,
              let artwork = trackArtwork else {
            return nil
        }
        
        return Track(title: title, artist: artist, albumName: albumName, artwork: artwork)
    }
}
