//
//  FavoritesTableViewCell.swift
//  AcademyMusic
//
//  Created by Lucca Molon on 21/06/21.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var musicNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var musicImage: UIImageView!
}
