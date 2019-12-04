//
//  IngredientsText.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct IngredientsText: View {
 var body: some View {
     Text("Ingredients")
         .font(.subheadline)
         .fontWeight(.light)
         .multilineTextAlignment(.leading)
         .lineLimit(nil)
 }
}

struct IngredientsText_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsText()
    }
}
