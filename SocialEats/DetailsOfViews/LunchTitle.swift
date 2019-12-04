//
//  LunchTitle.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct LunchTitle: View {
 var body: some View {
     Text("Lunch")
         .font(.title)
         .fontWeight(.medium)
         .multilineTextAlignment(.leading)
 }
}

struct LunchTitle_Previews: PreviewProvider {
    static var previews: some View {
        LunchTitle()
    }
}
