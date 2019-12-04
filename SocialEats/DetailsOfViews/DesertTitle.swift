//
//  DesertTitle.swift
//  
//
//  Created by Mike Dix on 11/22/19.
//

import SwiftUI

struct DesertTitle: View {
 var body: some View {
     Text("Desert")
         .font(.title)
         .fontWeight(.medium)
         .multilineTextAlignment(.leading)
 }
}

struct DesertTitle_Previews: PreviewProvider {
    static var previews: some View {
        DesertTitle()
    }
}
