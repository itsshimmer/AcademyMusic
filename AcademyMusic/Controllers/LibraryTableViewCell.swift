//
//  LibraryTableViewCell.swift
//  AcademyMusic
//
//  Created by Lucas Dimer Justo on 18/06/21.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collection: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
