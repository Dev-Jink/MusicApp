//
//  TrackCollectionViewCell.swift
//  MusicApp
//
//  Created by MyeongJin on 2021/04/07.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trackThumbnail.layer.cornerRadius = 4
        trackArtist.textColor = .systemGray2
    }
    
    func updateUI(item: Track?) {
        // TODO: 곡정보 표시하기
        guard let _ = item else { return }
        self.trackThumbnail.image = item?.artwork
        self.trackArtist.text = item?.artist
        self.trackTitle.text = item?.title
    }
}
