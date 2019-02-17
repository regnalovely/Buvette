//
//  ViewController.swift
//  Buvette
//
//  Created by etudiant on 05/11/2018.
//  Copyright © 2018 L3P-IEM. All rights reserved.
//

import UIKit

class Connexion: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var statut: UILabel!
	
	var user:String = ""
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		username.delegate = self
		password.delegate = self
		
        username.text = "lregna"
        password.text = "lovely"
    }
	
	// Fonction permettant de renvoyer une chaine de caractère selon un tableau de key/value donné
	func getParameters(parameters:[[String:String]]) -> String {
		var param:String = ""
		
		for parameter in parameters {
			param += "\(parameter["name"]!)=\(parameter["value"]!)&"
		}
		
		param.removeLast()

		return param
	}
	
	func getTableUser(data:NSDictionary){
		let user = data[1]
		print(user)
	}
	
    func seConnecter() -> Bool {
		//var stat:String = "Statut..."
		
		// L'URL de notre API
        let url = URL(string: "https://buvette-univ.zd.fr/")!
		
		// 	Tableau de key/value à envoyer dans la requête http
		//	C'est plus lisible et plus facile à implémenter qu'une chaine de caractère
		let tabParam = [
			["name":"username", "value":username.text!],
			["name":"password", "value":password.text!],
			["name"
				
				:"fonction", "value":"seConnecter"]
		]
		
		// Récupère la chaine de caractère
        let param = getParameters(parameters: tabParam)
		
		var request = URLRequest(url: url)
        request.httpMethod = "POST"
		request.httpBody = param.data(using: .utf8)
        
		let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in if error != nil {
				print("ERROR : \(String(describing: error))")
				return
			}
			do {
				if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary {
					self.getTableUser(data: json)
				}
			} catch let error {
				print(error.localizedDescription)
			}
        })
        task.resume()
		
		return true
    }
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return false
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
		if seConnecter() {
			//print("--Connexion to Accueil--")
			//print("--\(user)--")
			//let controller = segue.destination as! Accueil
			//controller.user = self.user
		}
	}
}
