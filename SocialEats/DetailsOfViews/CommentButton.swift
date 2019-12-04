//
//  CommentButton.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct CommentButton: View {
   var body: some View {
       Button(action: {
           
       }) {
           Image("comments").resizable().frame(width: 25, height: 25)
       }.padding(.leading, 6.0).foregroundColor(Color("darkAndWhite"))
   }
  }

struct CommentButton_Previews: PreviewProvider {
    static var previews: some View {
        CommentButton()
    }
}
