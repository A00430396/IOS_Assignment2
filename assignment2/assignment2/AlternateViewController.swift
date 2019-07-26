//
//  AlternateViewController.swift
//  assignment1
//
//  Created by Talwinder saini on 2019-07-20.
//  Copyright © 2019 nishant_talwinder. All rights reserved.
//

import UIKit

class AlternateViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var wonders:[Wonders] = []
//     let wondersOfTheWorld   = ["Great pyramid of Giza","Clossus of Rhodes","Hanging Gardens of Babylon", "Lighthouse of Alexandria", "Mausoleum at Halicarnassus", "Statue of Zeus at Olympia", "Temple of Artemis at Ephesu"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        loadJsonFile()
        
    }
    
    func loadJsonFile() {
        guard let jsonFile = Bundle.main.path(forResource: "wonders", ofType: "json") else { return }
        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile))
        guard
            let data = optionalData,
            let json = try? JSONSerialization.jsonObject(with: data),
            let dictionary = json as? [String: Any],
            let wondersDictionary = dictionary["features"] as? [[String: Any]]
            else { return }
        let validWonders = wondersDictionary.compactMap { Wonders(wonders: $0) }
        wonders.append(contentsOf: validWonders)
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
extension AlternateViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wonders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
            as? TableViewCell2 else { return UITableViewCell()}
        
        //cell.label.text = wondersOfTheWorld[indexPath.row]
        
        cell.label.text = wonders[indexPath.row].name
        //cell.icon.image = UIImage(data: data! as Data)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let controller = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        controller?.name = wonders[indexPath.row].name
        controller?.desc = wonders[indexPath.row].description ?? "Description not found!"
        controller?.imageURL = wonders[indexPath.row].imageURL
        self.navigationController?.pushViewController(controller!, animated: true)

    }


    
}
