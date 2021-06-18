//
//  LibraryViewController.swift
//  AcademyMusic
//
//  Created by Lucas Dimer Justo on 18/06/21.
//

import UIKit

class LibraryViewController: UIViewController {

    
    @IBOutlet weak var libraryTableView: UITableView!
    var musicService: MusicService = try! MusicService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarGray")
        navigationItem.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
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

    func tableView( tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let collections = musicService.loadLibrary()

        return collections.count

    }

    func tableView( tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "libraryListCell", for: indexPath) as? LibraryTableViewCell

        //configurar a célula
        let collection: MusicCollection = musicService.loadLibrary()[indexPath.row]


        cell?.collectionImage.image = UIImage(named: collection.id)
        cell?.title.text = collection.title
        cell?.collection.text = collection.mainPerson

        return cell!
    }
}
