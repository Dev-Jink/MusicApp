//
//  PlayerViewController.swift
//  MusicApp
//
//  Created by MyeongJin on 2021/04/08.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var playControlButton: UIButton!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalDurationLabel: UILabel!
    
    let simplePlayer = SimplePlayer.shared
    
    var timeObserver: Any?
    var isSeeking: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePlayButton()
        updateTime(time: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateTintColor()
        updateTrackInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func beginDrag(_ sender: UISlider){
        isSeeking = true
    }

    @IBAction func endDrag(_ sender: UISlider){
        isSeeking = false
    }
    
    @IBAction func seek(_ sender: UISlider){
        // TODO: seek
    }
    
    @IBAction func togglePlayButton(_ sender: UIButton){
        if simplePlayer.isPlaying {
            simplePlayer.pause()
        }else {
            simplePlayer.play()
        }
        updatePlayButton()
    }
}

extension PlayerViewController {
    func updateTrackInfo() {
        guard let track = simplePlayer.currentItem?.converToTrack() else { return }
        self.thumbnailImageView.image = track.artwork
        self.titleLabel.text = track.title
        self.artistLabel.text = track.artist
    }
    
    func updateTintColor() {
        playControlButton.tintColor = DefaultStyle.Colors.tint
        timeSlider.tintColor = DefaultStyle.Colors.tint
    }
    
    func updateTime(time: CMTime) {
        // print(time.seconds)
        // CurrentTime Label, totalDuraion Label, Slider
        
        //update TimeInfo
        currentTimeLabel.text = secondToString(sec: 0.0)
        totalDurationLabel.text = secondToString(sec: 0.0)
        
        if isSeeking == false {
            // seeking false 일떄 슬라이더 업데이트
        }
    }
    
    func secondToString(sec: Double) -> String {
        guard  sec.isNaN == false else { return "00:00" }
        let totalSeconds = Int(sec)
        let min = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", min, seconds)
    }
    
    func  updatePlayButton() {
        // TODO: update PlayButton UI > play / Stop
        if simplePlayer.isPlaying {
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
            playControlButton.setImage(image, for: .normal)
        } else {
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
            playControlButton.setImage(image, for: .normal)
        }
    }
}
