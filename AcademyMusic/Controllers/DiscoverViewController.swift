//
//  DiscoverViewController.swift
//  AcademyMusic
//
//  Created by João Brentano on 24/06/21.
//

import UIKit

class DiscoverViewController: UIViewController {

    
    @IBAction func showPlayerAction(_ sender: UIButton) {
        performSegue(withIdentifier: "presentPlayer", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
