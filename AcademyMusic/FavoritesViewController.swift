//
//  FavoritesViewController.swift
//  AcademyMusic
//
//  Created by Lucca Molon on 18/06/21.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var musicService: MusicService = try! MusicService()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func heartButtonAction(_ sender: Any) {
        
    }
    
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
        
        
//        navigationItem.titleView = searchBarView
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search"
//        searchController.isActive = true
//        self.definesPresentationContext = true
//        searchController.definesPresentationContext = false
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarGray")
        navigationItem.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        tableView.dataSource = self
        tableView.delegate = self
        do {
            self.musicService = try MusicService()
        } catch {
            print(error)
        }
        
    }
    
    
    }
