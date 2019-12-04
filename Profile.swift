//
//  Profile.swift
//  SocialEats
//
//  Created by Mike Dix on 11/19/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

   struct Profile: View {
   // let meals = self.MealInfo
    var body: some View {
       // ZStack {
        NavigationView {
            ZStack {
                VStack {
                    
                    HStack {
                        VStack {
                            NumberOfMealsText()
                            MealsText()
                        }
                        Spacer()
                        VStack {
                            UserProfileImage()
                            UsernameTextUnderImage()
                        }
                        Spacer()
                        VStack {
                            NumberOfFollowingText()
                            FollowingText()
                            }
                    }
                    HStack {
                        VStack {
                            NumberOfFlamesText()
                            FlamesText()
                        }
                        Spacer()
                         VStack {
                            NumerOfFollowersText()
                            FollowersText()
                        }
                    }
                    Divider()
                    VStack {
                    HStack {
                        BioText()
                        
                    }
                    Divider()
                        HStack {
                            Spacer()
                            Text("Recommendations")
                            Spacer()
                            Image(systemName: "plus")
                                .padding(.trailing, 10)
                                .contextMenu {
                                    Button(action: {
                                        
                                    }) {
                                        Text("Add a recommendation")
                                        Image(systemName: "plus.circle")
                                    }
                            }
                            //Spacer()
                            
                        }
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack {
                         ForEach(0..<14) {_ in
                            Image("brunch").resizable().frame(width: 75, height: 75).cornerRadius(10, antialiased: true)
                            .contextMenu {
                            Button(action: {
                                
                            }) {
                                Text("Remove recommendation")
                                Image(systemName: "trash.fill")
                            }
                         }
                         
                            }
                        }
                    }
                  Divider()
                    MealsList()
                    }
                    Spacer()
                }
            }.navigationBarTitle("Profile")
             .navigationBarItems(trailing:
            
                        HStack {
                            EditButton()
                        }
                )
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Group { Profile().environment(\.colorScheme, .dark)
            
            Profile()
        }
    }
}

struct MealsList: View {
    
    // Need to figure out how to get info from users post to populate this list
   // let meals = Bundle.main.decode([MealsOnProfile].self, from: )
    var body: some View {
        NavigationView {
        ZStack {
            List {
                HStack {
                    VStack {
                       
                        Image("drink").resizable().frame(width: 175.0, height: 150.0).cornerRadius(10.0)
                        HStack {
                            FireButton().padding(.leading, 10.0)
                            //Spacer()
                         CommentButton()
                            Spacer()
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        DescriptionOfMealOnProfile()
                        LocationOfMealOnProfile()
                        CategoryOfMealOnProfile()
                        IngredientsOfMealOnProfile()
                        Spacer()
                    }
                    Spacer()
                }
                HStack {
                    VStack {
                       
                        Image("drink").resizable().frame(width: 175.0, height: 150.0).cornerRadius(10.0)
                        HStack {
                            FireButton().padding(.leading, 10.0)
                            //Spacer()
                         CommentButton()
                            Spacer()
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        DescriptionOfMealOnProfile()
                        LocationOfMealOnProfile()
                        CategoryOfMealOnProfile()
                        IngredientsOfMealOnProfile()
                        Spacer()
                    }
                    Spacer()
                }
                HStack {
                    VStack {
                       
                        Image("drink").resizable().frame(width: 175.0, height: 150.0).cornerRadius(10.0)
                        HStack {
                            FireButton().padding(.leading, 10.0)
                            //Spacer()
                         CommentButton()
                            Spacer()
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        DescriptionOfMealOnProfile()
                        LocationOfMealOnProfile()
                        CategoryOfMealOnProfile()
                        IngredientsOfMealOnProfile()
                        Spacer()
                    }
                    Spacer()
                }
                HStack {
                    VStack {
                       
                        Image("drink").resizable().frame(width: 175.0, height: 150.0).cornerRadius(10.0)
                        HStack {
                            FireButton().padding(.leading, 10.0)
                            //Spacer()
                         CommentButton()
                            Spacer()
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        DescriptionOfMealOnProfile()
                        LocationOfMealOnProfile()
                        CategoryOfMealOnProfile()
                        IngredientsOfMealOnProfile()
                        Spacer()
                    }
                    Spacer()
                }
               // Text("yoo")
            }
            }.navigationBarTitle("Meals")
        }
    }
}

struct EditButton: View {
    var body: some View {
     
        Button(action: {
            
        }) {
            Image("edit").resizable().frame(width: 20, height: 20)
            
        }.foregroundColor(Color("darkAndWhite")).padding(.top, 83)
//            .contextMenu {
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                    Text("Edit Profile Picture")
//                }
       // }
    }
}


struct MealsListCard: View {
    var body: some View {
        
        Group {
        VStack {
            Text("Shrimp fried rice ")
                .font(.headline)
                //.foregroundColor(Color("universalOrange"))
                .lineLimit(1)
            Spacer()
            ZStack {
                HStack {
                    
                    Image("dinner").resizable().frame(width: 75.0, height: 75.0).cornerRadius(8.0).padding(.leading, 10.0).shadow(color: universalOrange, radius: 8.0)
                Spacer()
                    
            }
        }
        Divider()
    }
    }
    }
}



struct UserProfileImage: View {
    var body: some View {
        Image("profilePicture").resizable().clipShape(Circle()).frame(width: 70, height: 70).shadow(color: universalOrange, radius: 20)
            .contextMenu {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Change Profile Picture")
                }
        }
    }
}

struct UsernameTextUnderImage: View {
    var body: some View {
        Text("Username")
            .fontWeight(.medium)
            .foregroundColor(Color("universalOrange"))
    }
}

struct NumberOfMealsText: View {
    var body: some View {
        Text("10")
            .padding(.leading, 20.0)
    }
}

struct MealsText: View {
    var body: some View {
        Text("Meals")
            .padding(.leading, 20.0)
    }
}

struct NumberOfFollowingText: View {
    var body: some View {
        Text("100")
            .padding(.trailing, 20.0)
    }
}

struct FollowingText: View {
    var body: some View {
        Text("Following")
            
            .padding(.trailing, 20.0)
    }
}

struct NumberOfFlamesText: View {
    var body: some View {
        Text("320")
            .padding(.leading, 20.0)
    }
}

struct FlamesText: View {
    var body: some View {
        Text("Flames")
            
            .padding(.leading, 20.0)
    }
}

struct NumerOfFollowersText: View {
    var body: some View {
        Text("100")
            .padding(.trailing, 20.0)
    }
}

struct FollowersText: View {
    var body: some View {
        Text("Followers")
            
            .padding(.trailing, 20.0)
    }
}

struct BioText: View {
    var body: some View {
        Text("Bio")
            .lineLimit(4)
        
    }
    
}

struct MealsListTitle: View {
    var body: some View {
        Text("Meals")
            .font(.title)
            .fontWeight(.semibold)
            .padding(.leading, 15.0)
    }
}

struct DescriptionOfMealOnProfile: View {
    var body: some View {
        Text("Drink on the beach")
            .fontWeight(.semibold)
            .foregroundColor(Color("universalOrange"))
            .lineLimit(1)
    }
}

struct LocationOfMealOnProfile: View {
    var body: some View {
        Text("Location: Miami Beach")
            .multilineTextAlignment(.leading)
            .padding(.top, 5.0)
    }
}

struct CategoryOfMealOnProfile: View {
    var body: some View {
        Text("Category: Drink")
            .multilineTextAlignment(.leading)
            .padding(.top, 5.0)
    }
}

struct IngredientsOfMealOnProfile: View {
    var body: some View {
        Text("Ingredients")
            .multilineTextAlignment(.leading)
            .padding(.vertical, 5.0)
            .lineLimit(4)
    }
}
