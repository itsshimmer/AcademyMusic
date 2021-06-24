//
//  FavoritesTableViewCell.swift
//  AcademyMusic
//
//  Created by Lucca Molon on 21/06/21.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var musicNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var musicImage: UIImageView!
    var music: Music?
    var tableView: UITableView?
    var viewController: UIViewController?
    
    
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        let musicService: MusicService = try! MusicService()
        musicService.toggleFavorite(music: music!, isFavorite: false)
        self.tableView?.reloadData()
        viewController?.viewDidLoad()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
