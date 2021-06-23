//
//  PlayingViewController.swift
//  AcademyMusic
//
//  Created by Lucca Molon on 23/06/21.
//

import UIKit

class PlayingViewController: UIViewController {
    
    private var musicService: MusicService = try! MusicService()
    var song: Music? = nil
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var timePassed: UILabel!
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let song = song else { return }
        songImage.image = musicService.getCoverImage(forItemIded: song.id)
        songTitle.text = song.title
        artist.text = song.artist
        
    }
    

}
