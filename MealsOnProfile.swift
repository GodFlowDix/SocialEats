//
//  MealsOnProfile.swift
//  SocialEats
//
//  Created by Mike Dix on 11/23/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import Foundation
import SwiftUI

struct MealsOnProfile: Codable, Identifiable {
    var id: UUID
    var description: String
    var ingredients: String
    var flames: Int
    var date: Date
    var info: [MealInfo]
    //var comments: String
}

struct MealInfo: Codable, Equatable, Identifiable {
    var id: UUID
    var username: String
    var description: String
    var flames: Int
    var location: String
    var ingredients: String
    var date: Date
}
