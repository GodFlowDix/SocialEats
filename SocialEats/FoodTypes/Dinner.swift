//
//  Dinner.swift
//  SocialEats
//
//  Created by Mike Dix on 11/13/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import Foundation
import SwiftUI

struct Dinner: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var category: Category
    var description: String
    var ingredients: String
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case meat = "meat"
        case seafood = "seafood"
        case healthy = "healthy"
        case vegan = "vegan"
        case veggie = "veggie"
        case fruit = "fruit"
        case dairy = "dairy"
        case bread = "bread"
        case rice = "rice"
        case pasta = "pasta"
    }
}
