//
//  LibraryViewController.swift
//  AcademyMusic
//
//  Created by Lucas Dimer Justo on 18/06/21.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var libraryTableView: UITableView!
    var musicService: MusicService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarGray")
        navigationItem.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        libraryTableView.delegate = self
        libraryTableView.dataSource = self
        do {
            musicService = try MusicService()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        libraryTableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let collections = musicService?.loadLibrary()
        
        return collections?.count ?? 0

    }

    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "libraryListCell", for: indexPath) as? LibraryTableViewCell
        else {
            return UITableViewCell()
        }
        //configurar a célula
        let collection: [MusicCollection] = musicService?.loadLibrary() ?? []


        cell.collectionImage.image = musicService?.getCoverImage(forItemIded: collection[indexPath.row].id)
        cell.title.text = collection[indexPath.row].title
        cell.collection.text = collection[indexPath.row].mainPerson
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collection: [MusicCollection] = musicService?.loadLibrary() ?? []
    
        performSegue(withIdentifier: "toDetails", sender: collection[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails", let musicCollection = sender as? MusicCollection {
            let destination = segue.destination as? AlbumDetailViewController
            destination?.musicCollection = musicCollection
        }
    }
    
}
