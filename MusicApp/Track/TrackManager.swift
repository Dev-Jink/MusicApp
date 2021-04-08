//
//  TrackManager.swift
//  MusicApp
//
//  Created by MyeongJin on 2021/04/07.
//

import UIKit
import AVFoundation

class TrackManager {
    static var shared = TrackManager()
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    private init() {
        let tracks =  loadTracks()
        self.tracks = tracks
        self .albums = loadAlubums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement()
    }
    
    internal func loadTracks() -> [AVPlayerItem] {
        //read file as AVPlayerItem
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        let items = urls.map { AVPlayerItem(url: $0) }
        
        return items
    }
    
    internal func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
        let track = playerItem.converToTrack()
        return track
    }
    
    internal func loadAlubums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList: [Track] = tracks.compactMap { $0.converToTrack() }
        let albumDics = Dictionary(grouping: trackList, by: { (track) in track.albumName })
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        return albums
    }
    
    func loadOtherTodaysTrack() {
        self.todaysTrack = self.tracks.randomElement()
    }
}
