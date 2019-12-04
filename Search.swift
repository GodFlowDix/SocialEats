//
//  Search.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct Search: View {
    @State var txt = ""
   var body: some View {

    NavigationView {
    ZStack {
       // Color(.darkGray)
       // Color("wildColor").edgesIgnoringSafeArea(.all)
        LinearGradient(gradient: .init(colors: [Color("RentErm2"), Color("RentErm1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        
        VStack {
            SearchView(txt: $txt).padding(.top, 20.0)
            Spacer()
        }
        }
    .navigationBarTitle("Search Social Eats")
    }
    
   }
  }

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        Search().environment(\.colorScheme, .dark)
            
        Search()
        }
    }
}


struct SearchView: View {
    
    @Binding var txt: String
    
    var body: some View {
    
        VStack {
            
            ZStack {
                
                HStack {
                    
                    TextField("Search", text: $txt).foregroundColor(Color("darkAndWhite")).padding(.trailing, 75)
                }.padding()
                    .background(Color("darkAndWhite"))
                    .cornerRadius(19.0)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.txt = ""
                    }) {
                        Text("Cancel")
                    }.foregroundColor(Color("universalOrange"))
                }.padding()
            }
        }
    }
}
