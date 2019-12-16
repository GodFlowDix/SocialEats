//
//  DescriptionText.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct DescriptionText: View {
    var textToDisplay:String
 var body: some View {
    Text(textToDisplay)
         .font(.headline)
         .fontWeight(.semibold)
         .multilineTextAlignment(.leading)
         .lineLimit(2)
         .padding(.trailing, 9.0)
 }
}

struct DescriptionText_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionText(textToDisplay: "Description Example !!!")
    }
}
