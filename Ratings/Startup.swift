//
//  Startup.swift
//  DAAS
//
//  Created by David Fontenot on 1/5/15.
//  Copyright (c) 2015 HackMatch. All rights reserved.
//

import Foundation
import UIKit

class Startup: NSObject {
    var url: String
    var name: String
    var type: String
    var rating: Int
    
    init(url: String, name: String, type: String, rating: Int) {
        self.url = url
        self.name = name
        self.type = type
        self.rating = rating
        super.init()
    }
}
