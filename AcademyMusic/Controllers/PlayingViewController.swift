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
    var timer: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        song = musicService.favoriteMusics[0]
        guard let song = song else { return }
        songImage.image = musicService.getCoverImage(forItemIded: song.id)
        songTitle.text = song.title
        artist.text = song.artist
        slider.minimumValue = 0
        slider.maximumValue = Float(song.length)
        timePassed.text = formatter.string(from: TimeInterval(slider.value))
        remainingTime.text = formatter.string(from: song.length)
        if isPlaying {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
        musicService.favoriteMusics.contains(song) ? likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        isPlaying ? playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal) : playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        timePassed.text = formatter.string(from: TimeInterval(slider.value))
        remainingTime.text = formatter.string(from: (Double(slider.value) - song!.length))
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        slider.value = 0
        sliderAction(slider)
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if !musicService.queue.nextInCollection.isEmpty {
            song = musicService.queue.nextInCollection.first
            viewDidLoad()
        }
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        if isPlaying {
            isPlaying = false
            timer?.invalidate()
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        } else {
            isPlaying = true
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
            playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        }
    }
    
    @IBAction func likeButtonAction(_ sender: UIButton) {
        guard let song = song else { return }
        if musicService.favoriteMusics.contains(song) {
            musicService.toggleFavorite(music: song, isFavorite: false)
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            musicService.toggleFavorite(music: song, isFavorite: true)
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
    
    @objc func fireTimer() {
        slider.value += 1
        sliderAction(slider)
    }
    
}
