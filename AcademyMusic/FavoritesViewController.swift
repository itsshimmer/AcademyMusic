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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesListCell", for: indexPath) as? FavoritesTableViewCell
        else {
            return UITableViewCell()
        }
        //configurar a célula
        let songs: [Music] = musicService.favoriteMusics

        cell.musicImage.image = musicService.getCoverImage(forItemIded: songs[indexPath.row].id)
        cell.musicNameLabel.text = songs[indexPath.row].title
        cell.artistLabel.text = songs[indexPath.row].artist
        
        return cell
   
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarGray" )
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
