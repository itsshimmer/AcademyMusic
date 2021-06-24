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
    var isPlaying: Bool = true
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var timePassed: UILabel!
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    let formatter = DateComponentsFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.allowedUnits = [.minute, .second]
        
        song = musicService.favoriteMusics[0]
        guard let song = song else { return }
        songImage.image = musicService.getCoverImage(forItemIded: song.id)
        songTitle.text = song.title
        artist.text = song.artist
        slider.minimumValue = 0
        slider.maximumValue = Float(song.length)
        timePassed.text = formatter.string(from: TimeInterval(slider.value))
        remainingTime.text = formatter.string(from: song.length)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        timePassed.text = formatter.string(from: TimeInterval(slider.value))
        remainingTime.text = formatter.string(from: (Double(slider.value) - song!.length))
    }
    
    @objc func fireTimer() {
        slider.value += 1
        sliderAction(slider)
    }
    
}
