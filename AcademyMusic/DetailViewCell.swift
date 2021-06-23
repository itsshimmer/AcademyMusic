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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
