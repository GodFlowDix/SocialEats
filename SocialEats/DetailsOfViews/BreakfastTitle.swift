//
//  BreakfastTitle.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct BreakfastTitle: View {
   var body: some View {
    
   
            Text("Breakfast")
            .font(.title)
            .fontWeight(.medium)
                .multilineTextAlignment(.leading)

    
   }
  }

struct BreakfastTitle_Previews: PreviewProvider {
    static var previews: some View {
        BreakfastTitle()
    }
}
