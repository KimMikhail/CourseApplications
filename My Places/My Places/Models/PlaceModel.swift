//
//  PlaceModel.swift
//  My Places
//
//  Created by  Mikhail on 26.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import RealmSwift

class Place : Object{
    
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var restaurantImage: String?
    @objc dynamic var date = Date()
    @objc dynamic var rating = 0.0
    
    init(name: String, location: String?, type: String?, imageData: Data?, rating: Double) {
        self.name = name
        self.location = location
        self.type = type
        self.imageData = imageData
        self.rating = rating
    }
    
    required init() {
        super.init()
//        fatalError("init() has not been implemented")
    }
}
