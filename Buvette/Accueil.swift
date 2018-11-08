//
//  Accueil.swift
//  Buvette
//
//  Created by etudiant on 08/11/2018.
//  Copyright © 2018 L3P-IEM. All rights reserved.
//

import UIKit

class Accueil: UITabBarController {
    
    var user:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("TAB BAR : \(user)")

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            print("Ok Accueil to ListeCommande ?")
            let controller = segue.destination as! ListeCommande
            controller.user = self.user
    }

}
