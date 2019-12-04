   //
//  TimeLineView.swift
//  SocialEats
//
//  Created by Mike Dix on 11/12/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI
import Firebase
   
struct TimeLineView: View {
   //  @Binding var isNavigationBarHidden: Bool
    var body: some View {
        TabView {
        NavigationView {
            
            Home()
//            .navigationBarHidden(self.isNavigationBarHidden)
//            .onAppear {
//                self.isNavigationBarHidden = true
//            }
            .navigationBarHidden(true)
                //.edgesIgnoringSafeArea([.all])
        }.tabItem
            {
                Image(systemName: "house").foregroundColor(universalOrange)
            }
            Profile()
       .tabItem {
                
            Image(systemName: "person")

                }
        Search()
            .tabItem {
            
                Image(systemName: "magnifyingglass")

            }
            
//            Post()
//                .tabItem {
//         
//            Image(systemName: "camera")
//                   
//         }
        } .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        TimeLineView().environment(\.colorScheme, .dark)
            
            TimeLineView()
        }
        }
    }



   
   
  
