//
//  LunchView.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct LunchView: View {
    @State var data = DataManager()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(data.meals){ meal in
                    LunchCard(mealToDisplay: meal)
                }
            }
        }
    }
}

struct LunchView_Previews: PreviewProvider {
    static var previews: some View {
        LunchView()
    }
}

struct LunchCard: View {
    var mealToDisplay: MealPost

 var profilePic = ""
 var imName = ""
 var body: some View {

     VStack {
         HStack(alignment: .top) {
             Image(profilePic).resizable().clipShape(Circle()).frame(width: 40, height: 40)
                        //Spacer()
            UsernameText(textToDisplay: mealToDisplay.id)
                        Spacer()
            DescriptionText(textToDisplay: mealToDisplay.mealDetails)
                    }
         Image(mealToDisplay.url).resizable().frame(width: 320, height: 215).cornerRadius(11)
        
         HStack {
             FireButton()
             CommentButton()
             Spacer()
         }
                   
         HStack {
            IngredientsText(textToDisplay: mealToDisplay.ingredients).padding(.leading, 6.0)
             Spacer()
             }
         }
     .padding(.leading, 15.0)
     }
}


 struct BigLunchCard: View {
     var mealToDisplay: MealPost
         var profilePic = ""
         var imName = ""
         var id = ""
         var body: some View {
             ZStack {
             VStack {
                        HStack {
                    Image(profilePic).resizable().clipShape(Circle()).frame(width: 40, height: 40)
                            UsernameText(textToDisplay: mealToDisplay.id)
                        Spacer()
                            DescriptionText(textToDisplay: mealToDisplay.mealDetails)
                    }
                    .padding(.leading, 9.0)
                    Image(mealToDisplay.url).resizable().frame(height: 375).cornerRadius(3)
                        
                HStack {
                    FireButton()
                    CommentButton()
                    Spacer()
                }
                HStack {
                    IngredientsText(textToDisplay: mealToDisplay.ingredients).padding(.leading, 6.0)
                    Spacer()
                }.padding(.bottom, 30)
            }
        }
    }
}

struct BigLunchView: View {
    @State var data = DataManager()

          var body: some View {
          
              ScrollView(.vertical, showsIndicators: false) {
                 
                ForEach(data.meals){ meal in
                        BigLunchCard(mealToDisplay: meal)
                    }

//                      ForEach(0..<5) {_ in
//                       BigLunchCard(profilePic: "profilePicture", imName: "lunch", id: "")
//
//
//                   }
              }
          }
      }








struct SeeAllLunch: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

           var btnBack : some View { Button(action: {
               self.presentationMode.wrappedValue.dismiss()
               }) {
                   HStack {
                   Image("backOrange") // set image here
                       .aspectRatio(contentMode: .fit)
                       .foregroundColor(universalOrange)
                       .frame(width: 10.0, height: 10.0)
                       Text("Go back")
                       .foregroundColor(universalOrange)
                   }
               }
           }
        var body: some View {
            
            NavigationView {
                
                 ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        BigLunchView()
                    }
                }
            }.navigationBarTitle("All Lunch Posts")
             .navigationBarBackButtonHidden(true)
             .navigationBarItems(leading: btnBack)
        }
    }
