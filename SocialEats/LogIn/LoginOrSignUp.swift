//
//  LoginOrSignUp.swift
//  SocialEats
//
//  Created by Mike Dix on 11/4/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI


let universalOrange = Color(red: 253.0/255.0, green: 127.0/255.0, blue: 44.0/255.0)

struct LoginOrSignUp: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                 LinearGradient(gradient: .init(colors: [Color("RentErm1"), Color("RentErm2")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        VStack {
        VStack(alignment: .center) {
            SocialEatsTitle()
            //Spacer()
        }
        .padding(.top, 5)
            
        VStack(alignment: .leading) {
                
            ShowCreationsText()
            ShareRecipiesText()
            TrySomethingText()
            NextMealText()
            VStack(alignment: .leading) {
                CreateAccountLink()
            }
                Spacer()
                
        VStack {
            AlreadyHaveAccountText()
            LoginLink()
            }
                Spacer()
            }
            .padding(.top, 170.0)
            Spacer()
                }
            }
        .navigationBarHidden(true)
        }
    }
}

struct LoginOrSignUp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginOrSignUp().environment(\.colorScheme, .dark)
        }
    }
}

struct SocialEatsTitle: View {
    var body: some View {
        Text("Social Eats")
            .font(.largeTitle)
           // .multilineTextAlignment(.center)
            .foregroundColor(universalOrange)
            //.padding()
    }
}

struct ShowCreationsText: View {
    var body: some View {
        Text("Show you creations")
            .font(.headline)
            .multilineTextAlignment(.leading)
    }
}

struct ShareRecipiesText: View {
    var body: some View {
        Text("Share recipies")
        .font(.headline)
        .multilineTextAlignment(.leading)
        
    }
}

struct TrySomethingText: View {
    var body: some View {
        Text("Try something new")
        .font(.headline)
        .multilineTextAlignment(.leading)
    }
}

struct NextMealText: View {
    var body: some View {
        Text("Find your next meal today")
        .font(.headline)
        .multilineTextAlignment(.leading)
    }
}

struct AlreadyHaveAccountText: View {
    var body: some View {
        Text("Already have an account?")
    }
}

struct CreateAccountLink: View {
    var body: some View {
        NavigationLink(destination: CreateAccountView()) {
            Text("Create an account")
        } .padding(.top)
          .foregroundColor(.orange)
    }
}

struct LoginLink: View {
    var body: some View {
        NavigationLink(destination: LoginView()) {
            Text("Log in")
        }.foregroundColor(.orange)
    }
}
