//
//  LoginView.swift
//  SocialEats
//
//  Created by Mike Dix on 11/7/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI
import Firebase


struct LoginView: View {
    
    @ObservedObject private var keyboard = KeyboardResponder()
    @State var email = ""
    @State var password = ""
    @State var shown = false
    @State var msg = ""
    @State var action: Int? = 0
   // @State var isNavigationBarHidden: Bool = true
    var body: some View {
        
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: .init(colors: [Color("RentErm2"), Color("RentErm1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                          
            VStack {
               
                
            HStack {
                    Image( "emailFilled").resizable().frame(width: 20, height: 20)
                    TextField("Email", text: $email).padding(.leading, 12).font(.system(size: 20))
                        }.padding(12).cornerRadius(20)
                       Divider()
            HStack {
                    Image("lockFilled").resizable().frame(width: 20, height: 20)
                    SecureField("Password", text: $password).padding(.leading,12).font(.system(size: 20))
                        }.padding(12).cornerRadius(20)
                       Divider()
                
                HStack {
                    
                
                        
                    NavigationLink(destination: TimeLineView(), tag: 1, selection: $action) {
                    Button(action: {
                        
                      //  @Binding var username: String
                        // if nothing entered
                        if self.email == "" && self.password == "" {
                            self.msg = "Please fill the contents"
                            self.shown.toggle()
                            return
                        }
                        //if email not entered
                        if self.email == "" && self.password != ""  {
                            self.msg = "Please enter a email address"
                            self.shown.toggle()
                            return
                        }
                        //if password not entered
                        if self.password == "" && self.email != "" {
                            self.msg = "Please enter a pasword"
                            self.shown.toggle()
                            return
                        }
                       
                        
                        Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                            if err != nil {
                                print((err!.localizedDescription))
                                self.msg = err!.localizedDescription
                                self.shown.toggle()
                                return
                            }
                           
                            self.msg = "Welcome back to Social Eats!"
                            self.shown.toggle()
                        }
                        self.action = 1

                    }) {
                        Text("Sign in")
                        .foregroundColor(.white).padding()
                    }
                    .frame(width: 150)
                    .background( LinearGradient(gradient: .init(colors: [Color("RentErm2"), Color("RentErm1")]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .cornerRadius(18)
                        .offset(y: 25)
                .shadow(radius: 20)
                }.alert(isPresented: $shown) {
                    return Alert(title: Text(self.msg))
                    }
                }
                  .padding(.horizontal, 18)
            }.padding(.bottom, keyboard.currentHeight)
            .edgesIgnoringSafeArea(.bottom)
            .animation(.easeOut(duration: 0.16))
                
            }
        }.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.bottom)
//        .navigationBarHidden(self.isNavigationBarHidden)
//                  .onAppear {
//                      self.isNavigationBarHidden = true
//                  }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView() .environment(\.colorScheme, .dark)
    }
}
