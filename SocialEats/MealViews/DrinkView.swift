//
//  DrinkView.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct DrinkView: View {
    @State var data = DataManager()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {

                ForEach(data.meals){ meal in
                    DrinkCard(mealToDisplay: meal)
                }
            }
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView()
    }
}


struct DrinkCard: View {
    var mealToDisplay: MealPost

var profilePic = ""
var imName = ""
var body: some View {

     VStack {
               HStack(alignment: .top) {
               Image(mealToDisplay.pic).resizable().clipShape(Circle()).frame(width: 30, height: 30)
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
    .padding(.leading, 15)
    }
}

struct BigDrinkCard: View {
    var mealToDisplay: MealPost
      var profilePic = ""
      var imName = ""
      var id = ""
      var body: some View {
          ZStack {
           VStack {
                   HStack {
               Image(mealToDisplay.pic).resizable().clipShape(Circle()).frame(width: 40, height: 40)
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
            IngredientsText(textToDisplay: mealToDisplay.ingredients) .padding(.leading, 6.0)
                   Spacer()
               }.padding(.bottom, 30)
           }
       }
      }
  }
  
  struct BigDrinkView: View {
    @State var data = DataManager()

      var body: some View {
      
          ScrollView(.vertical, showsIndicators: false) {
             

            ForEach(data.meals){ meal in
                DrinkCard(mealToDisplay: meal)
            }
          }
      }
  }
 


struct SeeAllDrink: View {
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
                    BigDrinkView()
                }
              }
            }
        .navigationBarTitle("All Drink Posts")
         .navigationBarBackButtonHidden(true)
         .navigationBarItems(leading: btnBack)
    }
}
