//
//  AboutViewController.swift
//  AcademyMusic
//
//  Created by Lucca Molon on 22/06/21.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        album = musicService.getCollection(id: "2KJjOBX280F3hZZE1xO33O")
        guard let album = album else { return UITableViewCell() }
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AboutTableView", for: indexPath) as? AboutTableViewCell else {
                return UITableViewCell()
            }
            cell.albumImage.image = musicService.getCoverImage(forItemIded: album.id)
            cell.albumName.text = album.title
            cell.artistName.text = "Album by \(album.mainPerson)"
            albumLength = 0
            for music in album.musics {
                albumLength += music.length
            }
            cell.albumDuration.text = "\(album.musics.count) songs, \(timeIntervalFormatter.string(from: albumLength)!)"
            cell.albumReleaseDate.text = "Released in \(dateFormatter.string(from: album.referenceDate))"
            cell.about.text = album.albumDescription
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AboutArtistTableView", for: indexPath) as? AboutArtistTableViewCell else { return UITableViewCell() }
        cell.aboutArtistTitle.text = "About \(album.mainPerson)"
        cell.aboutArtist.text = album.albumArtistDescription
        return cell
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    private var musicService: MusicService = try! MusicService()
    var album: MusicCollection?
    
    var albumLength: TimeInterval = 0
    
    let dateFormatter = DateFormatter()
    let timeIntervalFormatter = DateComponentsFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        timeIntervalFormatter.unitsStyle = .abbreviated
        timeIntervalFormatter.allowedUnits = [.hour, .minute]

    }
}
