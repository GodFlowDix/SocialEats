//
//  IngredientsText.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct IngredientsText: View {
    var textToDisplay:String
    @ObservedObject var observedData = DataManager()
 var body: some View {
    
    
           Text(textToDisplay)
            .font(.subheadline)
            .fontWeight(.light)
            .multilineTextAlignment(.leading)
            .lineLimit(nil)

    
//    //let text = observedData.datas
//    for i in observedData.datas {
//       Text("\(i.ingredients)")
//        .font(.subheadline)
//        .fontWeight(.light)
//        .multilineTextAlignment(.leading)
//        .lineLimit(nil)

    }
   
   // return text.
    

//    let ingred = Text("\(i.)")
//         .font(.subheadline)
//         .fontWeight(.light)
//         .multilineTextAlignment(.leading)
//         .lineLimit(nil)
//    return ingred
 }
//}



struct IngredientsText_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsText(textToDisplay: "Ingredientssss")
    }
}
