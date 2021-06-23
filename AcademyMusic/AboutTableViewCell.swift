//
//  AboutTableViewCell.swift
//  AcademyMusic
//
//  Created by Lucca Molon on 23/06/21.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumDuration: UILabel!
    @IBOutlet weak var albumReleaseDate: UILabel!
    @IBOutlet weak var about: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
