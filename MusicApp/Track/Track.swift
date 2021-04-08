//
//  Track.swift
//  MusicApp
//
//  Created by MyeongJin on 2021/04/07.
//

import UIKit

struct Track {
    let title:      String
    let artist:     String
    let albumName:  String
    let artwork:    UIImage
    
    init(title: String, artist: String, albumName: String, artwork:UIImage) {
        self.title = title
        self.artist = artist
        self.albumName = albumName
        self.artwork = artwork
    }
}
