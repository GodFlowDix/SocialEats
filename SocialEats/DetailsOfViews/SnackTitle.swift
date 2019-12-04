//
//  SnackTitle.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI


struct SnackTitle: View {
 var body: some View {
     Text("Snack")
         .font(.title)
         .fontWeight(.medium)
         .multilineTextAlignment(.leading)
 }
}

struct SnackTitle_Previews: PreviewProvider {
    static var previews: some View {
        SnackTitle()
    }
}
