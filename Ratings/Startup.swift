//
//  Startup.swift
//  Ratings
//
//  Created by David Fontenot on 1/5/15.
//  Copyright (c) 2015 HackMatch. All rights reserved.
//

import Foundation
import UIKit

class Startup: NSObject {
    var name: String
    var type: String
    var rating: Int
    
    init(name: String, type: String, rating: Int) {
        self.name = name
        self.type = type
        self.rating = rating
        super.init()
    }
}
