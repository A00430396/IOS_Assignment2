//
//  DetailViewController.swift
//  assignment1
//
//  Created by Talwinder saini on 2019-07-26.
//  Copyright © 2019 nishant_talwinder. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var placeDesc: UILabel!
    
    var name = ""
    var desc = ""
    var imageURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = name
        placeDesc.text = desc
        downloaded(from: URL(string: imageURL)!)
    }
    
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image1 = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image.image = image1
            }
            }.resume()
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
