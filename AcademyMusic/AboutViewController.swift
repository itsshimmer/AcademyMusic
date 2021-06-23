//
//  AboutViewController.swift
//  AcademyMusic
//
//  Created by Lucca Molon on 22/06/21.
//

import UIKit

class AboutViewController: UIViewController {
    
    
    private var musicService: MusicService = try! MusicService()
    var album: MusicCollection?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumDuration: UILabel!
    @IBOutlet weak var albumReleaseDate: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var aboutArtistTitle: UILabel!
    @IBOutlet weak var aboutArtist: UILabel!
    
    var albumLength: TimeInterval = 0
    
    let dateFormatter = DateFormatter()
    let timeIntervalFormatter = DateComponentsFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isScrollEnabled = true
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        timeIntervalFormatter.unitsStyle = .abbreviated
        timeIntervalFormatter.allowedUnits = [.hour, .minute]
        album = musicService.getCollection(id: "2KJjOBX280F3hZZE1xO33O")
        guard let album = album else { return }
        albumImage.image = musicService.getCoverImage(forItemIded: album.id)
        albumName.text = album.title
        for music in album.musics {
            albumLength += music.length
        }
        artistName.text = "Album by \(album.mainPerson)"
        albumDuration.text = "\(album.musics.count) songs, \(timeIntervalFormatter.string(from: albumLength)!)"
        albumReleaseDate.text = "Released in \(dateFormatter.string(from: album.referenceDate))"
        about.text = album.albumDescription
        aboutArtistTitle.text = "About \(album.mainPerson)"
        aboutArtist.text = album.albumArtistDescription
    }
}
