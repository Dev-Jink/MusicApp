//
//  Album.swift
//  MusicApp
//
//  Created by MyeongJin on 2021/04/07.
//

import UIKit

struct Album {
    let title: String
    let tracks: [Track]
    
    var thumnail: UIImage? {
        return tracks.first?.artwork
    }
    
    var artist: String? {
        return tracks.first?.artist
    }
    
    init(title: String, tracks: [Track]){
        self.title = title
        self.tracks = tracks
    }
}
