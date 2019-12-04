//
//  BreakfastView.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct BreakfastView: View {
    var body: some View {
    
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {

                ForEach(0..<5) {_ in
                    BreakfastCard(profilePic: "profilePicture", imName: "breakfast", id: "")
                
                
                }
            }
        }
    }
}

struct BreakfastView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        BreakfastView()
            SeeAllBreakfast()
        }
    }
}

struct BreakfastCard: View {
    var profilePic = ""
    var imName = ""
    var id = ""
    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
            Image(profilePic).resizable().clipShape(Circle()).frame(width: 30, height: 30)
               UsernameText()
               Spacer()
               DescriptionText()
            }
            Image(imName).resizable().frame(width: 320, height: 215).cornerRadius(11)
            
            HStack {
                FireButton()
                CommentButton()
                Spacer()
            }
            
            HStack {
                IngredientsText().padding(.leading, 6.0)
                Spacer()
            }
        }
        .padding(.leading, 15)
    }
}

 struct BigBreakfastCard: View {
    var profilePic = ""
    var imName = ""
    var id = ""
    var body: some View {
        ZStack {
        VStack {
                  HStack {
             Image(profilePic).resizable().clipShape(Circle()).frame(width: 40, height: 40)
                    UsernameText()
                      Spacer()
                    DescriptionText()
                  }
                  .padding(.leading, 9.0)
                Image(imName).resizable().frame(height: 375).cornerRadius(3)
            
            HStack {
                FireButton()
                CommentButton()
                Spacer()
                }
            HStack {
                
            IngredientsText()
                .padding(.leading, 6.0)
                
                Spacer()
            }.padding(.bottom, 30)
            }
        }
    }
}

struct BigBreakfastView: View {
    var body: some View {
    
        ScrollView(.vertical, showsIndicators: false) {
           

                ForEach(0..<5) {_ in
                 BigBreakfastCard(profilePic: "profilePicture", imName: "breakfast", id: "")
                
                
             }
        }
    }
}

struct SeeAllBreakfast: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image("backOrange") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(universalOrange)
                .frame(width: 10.0, height: 10.0)
                Text("Go back").foregroundColor(universalOrange)
            }
        }
    }
    var body: some View {
        
        NavigationView {
            
             ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    ForEach(0..<5) {_ in
                                
                    BigBreakfastView()
                    }
                    
                }
            }
        }.navigationBarTitle("All Breakfast Posts")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        
        
    }
}
