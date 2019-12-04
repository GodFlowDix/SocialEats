//
//  UserStore.swift
//  SocialEats
//
//  Created by Mike Dix on 11/25/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import Combine

class UserStore: ObservableObject {
    
    let db = Firestore.firestore()
    var userArray: [UserModel] = []
    
    var didChange = PassthroughSubject<Array<Any>, Never>()
    
    init() {
        
        db.collection("Users").addSnapshotListener {(snapshot, error) in
            if error != nil {
                
            } else {
                self.userArray.removeAll(keepingCapacity: false)
                
                for document in snapshot!.documents {
                    
                    if let userUidFromFirebase = document.get("useruidfromfirebase") as? String {
                        
                        if let userName = document.get("username") as? String {
                            let currentIndex = self.userArray.last?.id
                            
                            let createdUser = UserModel(id: (currentIndex ?? -1) + 1, name: userName, uidFromFirebase: userUidFromFirebase)
                            
                            self.userArray.append(createdUser)
                        }
                    }
                }
                self.didChange.send(self.userArray)
            }
        }
    }
    
}

