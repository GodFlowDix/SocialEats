//
//  DrinkTitle.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct DrinkTitle: View {
   var body: some View {
       Text("Drink")
           .font(.title)
           .fontWeight(.medium)
           .multilineTextAlignment(.leading)
   }
  }

struct DrinkTitle_Previews: PreviewProvider {
    static var previews: some View {
        DrinkTitle()
    }
}
