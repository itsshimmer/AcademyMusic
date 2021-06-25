//
//  AboutArtistTableViewCell.swift
//  AcademyMusic
//
//  Created by Lucca Molon on 23/06/21.
//

import UIKit

class AboutArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var aboutArtistTitle: UILabel!
    @IBOutlet weak var aboutArtist: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
