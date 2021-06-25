//
//  AlbumDetailViewController.swift
//  AcademyMusic
//
//  Created by Lucas Dimer Justo on 22/06/21.
//

import UIKit

class AlbumDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    var musicCollection: MusicCollection? = nil
    var musicService: MusicService? = nil
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var collectionTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var songCount: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var detailTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailTableView.delegate = self
        detailTableView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = false
        let button = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.myRightSideBarButtonItemTapped(_:)))
        button.setBackgroundImage(UIImage(systemName: "info.circle"), for: UIControl.State.normal, barMetrics: UIBarMetrics.default)
        button.accessibilityRespondsToUserInteraction = true
        self.navigationItem.rightBarButtonItem = button
        do {
            musicService = try MusicService()
        } catch {
            print(error.localizedDescription)
        }
        self.title = musicCollection?.title
        collectionImage.image = musicService?.getCoverImage(forItemIded: musicCollection!.id)
        collectionTitle.text = musicCollection?.title
        artist.text = "Album by \(musicCollection?.mainPerson ?? "")"
        songCount.text = "\(musicCollection?.musics.count ?? 0) songs"
        let form = DateFormatter()
        form.locale = Locale(identifier: "en_US")
        form.dateStyle = .medium
        form.timeStyle = .none
        releaseDate.text = "Released \(form.string(from: musicCollection!.referenceDate))"

        
    }
    
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        performSegue(withIdentifier: "about", sender: musicCollection)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "about", let musicCollection = sender as? MusicCollection {
            let navBar = segue.destination as? UINavigationController
            let destination = navBar?.topViewController as? AboutViewController
            destination?.collection = musicCollection
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicCollection?.musics.count ?? 0
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailListCell", for: indexPath) as? DetailViewCell
        else {
            return UITableViewCell()
        }
        //configurar a célula

        let music = musicCollection?.musics[indexPath.row]
        cell.music = music
        let contain: Bool = musicService!.favoriteMusics.contains(music!)
        if contain {
            cell.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
        }else {
            cell.favoriteButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        }
        cell.musicImage.image = UIImage(named: music!.id)
        cell.musicTitle.text = music?.title ?? ""
        cell.artist.text = music?.artist ?? ""
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
