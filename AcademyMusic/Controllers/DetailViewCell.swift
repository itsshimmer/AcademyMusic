//
//  DetailViewCell.swift
//  AcademyMusic
//
//  Created by Lucas Dimer Justo on 23/06/21.
//

import UIKit

class DetailViewCell: UITableViewCell {
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var music: Music?
    let musicService: MusicService = try! MusicService()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        let contain: Bool = musicService.favoriteMusics.contains(music!)
        musicService.toggleFavorite(music: music!, isFavorite: !contain)
        if contain {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        }else {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
        }
    }
    
}
