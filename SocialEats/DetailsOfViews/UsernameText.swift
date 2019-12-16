//
//  UsernameText.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI
import Firebase

struct UsernameText: View {
     var textToDisplay:String
   // @ObservedObject var userStore = UserStore()
   var body: some View {
    
    Text(textToDisplay)
        .font(.subheadline)
        .fontWeight(.regular)
        .foregroundColor(Color("universalOrange"))
//    for user in (userStore.userArray) {
//
//        Text(user.name)
//        .font(.subheadline)
//        .fontWeight(.regular)
//        .foregroundColor(Color("universalOrange"))
//
//    }
//      return UserModel
    }
   }
  
  

struct UsernameText_Previews: PreviewProvider {
    static var previews: some View {
        UsernameText(textToDisplay: "username text!!!!")
    }
}
