//
//  Brunch.swift
//  SocialEats
//
//  Created by Mike Dix on 11/13/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import Foundation
import SwiftUI

struct Brunch: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var category: Category
    var description: String
    var ingredients: String
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case healthy = "healthy"
        case bread = "bread"
        case egg = "egg"
        case meat = "meat"
        case vegan = "vegan"
    }
}
