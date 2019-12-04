//
//  Person.swift
//  SocialEats
//
//  Created by Mike Dix on 11/19/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct PostMeal: Identifiable {
    var id = UUID()
    var description: String
    var ingredients: String
    var image: UIImage
    var category: Category
   // let location: String
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case breakfast = "breakfast"
        case brunch = "brunch"
        case lunch = "lunch"
        case dinner = "dinner"
        case snack = "snack"
        case desert = "desert"
        case drink = "drink"
    }
}
