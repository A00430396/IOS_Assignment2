//
//  wonders.swift
//  assignment1
//
//  Created by Talwinder saini on 2019-07-20.
//  Copyright © 2019 nishant_talwinder. All rights reserved.
//

import Foundation

struct Wonders {
    let name: String
    let description: String?
    let userRating: Double
    let imageURL: String
    let coordinates: [Double]
    init?(wonders: [String: Any]) {
        guard let properties = wonders["properties"] as? [String: Any], let geometry = wonders["geometry"] as? [String: Any] else { return nil }
        self.name = properties["name"] as? String ?? ""
        self.description = properties["description"] as? String
        self.userRating = properties["userRating"] as? Double ??  0.0
        self.imageURL = properties["imageURL"] as? String ?? ""
        self.coordinates = properties["coordinates"] as? [Double] ?? []
    }

}
