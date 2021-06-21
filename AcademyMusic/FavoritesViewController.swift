//
//  FavoritesViewController.swift
//  AcademyMusic
//
//  Created by Lucca Molon on 18/06/21.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var musicService: MusicService = try! MusicService()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicService.favoriteMusics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoritesTableViewCell else { return UITableViewCell()}
        let music = musicService.favoriteMusics[indexPath.row]
        cell.textLabel?.text = music.title
        cell.detailTextLabel?.text = music.artist
        cell.musicImage.image = musicService.getCoverImage(forItemIded: musicService.favoriteMusics[indexPath.row].id)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarGray" )
        tableView.dataSource = self
        tableView.delegate = self
        do {
            self.musicService = try MusicService()
        } catch {
            print(error)
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    }
