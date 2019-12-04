//
//  User.swift
//  SocialEats
//
//  Created by Mike Dix on 11/19/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import Foundation
import UIKit

class User {
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
//struct User: Identifiable {
//    var id = UUID()
//    var firstName: String
//    var lastName: String
//    var location: String
//    var favoriteFood: String
//    var username: String
//}
