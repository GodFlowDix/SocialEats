//
//  DinnerTitle.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct DinnerTitle: View {
   var body: some View {
       Text("Dinner")
           .font(.title)
           .fontWeight(.medium)
           .multilineTextAlignment(.leading)
   }
  }
struct DinnerTitle_Previews: PreviewProvider {
    static var previews: some View {
        DinnerTitle()
    }
}
