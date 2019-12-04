//
//  BrunchTitle.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct BrunchTitle: View {
 var body: some View {
     Text("Brunch")
         .font(.title)
         .fontWeight(.medium)
         .multilineTextAlignment(.leading)
 }
}

struct BrunchTitle_Previews: PreviewProvider {
    static var previews: some View {
        BrunchTitle()
    }
}
