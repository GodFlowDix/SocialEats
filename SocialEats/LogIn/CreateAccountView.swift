//
//  CreateAccountView.swift
//  SocialEats
//
//  Created by Mike Dix on 11/7/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI
import Firebase
//import Combine

//class to push the textfields up during typing 
final class KeyboardResponder: ObservableObject {
    private var notificationCenter: NotificationCenter
    @Published private(set) var currentHeight: CGFloat = 0

    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }
}

struct CreateAccountView: View {
    
    let db = Firestore.firestore()
    @ObservedObject var userStore = UserStore()
    
     @ObservedObject private var keyboard = KeyboardResponder()
     @State var email = ""
     @State var password = ""
     @State  var username = ""
     @State var shown = false
     @State var msg = ""
     @State var action: Int? = 0
     @State var showCreateAccountView = true
    @State var isNavigationBarhidden: Bool = true
     var body: some View {
         
         NavigationView {
            
       
            ZStack {
                LinearGradient(gradient: .init(colors: [Color("RentErm2"), Color("RentErm1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
 
             VStack {
             SocialEatsTitle()
                HStack {
                    Image( "emailFilled").resizable().frame(width: 20, height: 20)
                    TextField("Email", text: $email).padding(.leading, 12).font(.system(size: 20))
                    }.padding(12).cornerRadius(20)
                Divider()
                HStack {
                    Image("lockFilled").resizable().frame(width: 20, height: 20)
                    SecureField("Password", text: $password).padding(.leading, 12).font(.system(size: 20))
                    }.padding(12).cornerRadius(20)
                Divider()
                HStack {
                    Image("personFilled").resizable().frame(width: 20, height: 20)
                    TextField("Username", text: $username).padding(.leading, 12).font(.system(size: 20))
                    }.padding(12).cornerRadius(20)
                Divider()
     
                 
                 HStack {
                    NavigationLink(destination: TimeLineView(), tag: 1, selection: $action) {
                     Button(action: {
                         //if noting is entered
                        if self.email == "" && self.password == "" && self.username == "" {
                            self.msg = "Please fill the contents"
                            self.shown.toggle()
                            return
                        }
                        //if username is not entered
                        if self.username == "" && self.email != "" && self.password != "" {
                            self.msg = "Please enter a username for your profile"
                            self.shown.toggle()
                            return
                        }
                        //if email is not entered
                        if self.email == "" && self.username != "" && self.password != "" {
                            self.msg = "Please enter a email address"
                            self.shown.toggle()
                            return
                        }
                        //if password is not entered
                        if self.password == "" && self.username != "" && self.email != "" {
                            self.msg = "Please enter a pasword"
                            self.shown.toggle()
                            return
                        }
                        //if email and password not entered
                        if self.email == "" && self.password == "" && self.username != "" {
                            self.msg = "Please enter an email and password"
                            self.shown.toggle()
                            return
                        }
                        //if email and username not entered
                        if self.email == "" && self.password != "" && self.username == "" {
                            self.msg = "Please enter an email and username"
                            self.shown.toggle()
                            return
                        }
                        //if password and username not entered
                        if self.email != "" && self.password == "" && self.username == "" {
                            self.msg = "Please enter an password and username"
                            self.shown.toggle()
                            return
                        }
                        
                        
                        Auth.auth().createUser(withEmail: self.email, password: self.password) { (res, err) in
                             if err != nil {
                                 print((err!.localizedDescription))
                                 self.msg = err!.localizedDescription
                                 self.shown.toggle()
                                 return
                            }
                                else {

                                //user Created
                                //Database
                                var ref: DocumentReference? = nil
                                var myUserDictionary: [String: Any] = ["username": self.username, "useremail": self.email, "useruidfromfirebase": res!.user.uid]

                                ref = self.db.collection("Users").addDocument(data: myUserDictionary, completion: { (error) in
                                    if error != nil {

                                }
                            })
                                 self.msg = "\(self.username)'s profile successfully created!"
                                self.shown.toggle()
                                //user view
                               // self.showCreateAccountView = false
                            }
                             
                            self.msg = "\(self.username)'s profile successfully created!"
                             self.shown.toggle()
                         }
                        self.action = 1
                     }) {
                         Text("Sign up")
                            .foregroundColor(.white).padding()
                     }.frame(width: 150)
                    .background( LinearGradient(gradient: .init(colors: [Color("RentErm2"), Color("RentErm1")]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .cornerRadius(18)
                        .offset(y: 25)
                    .shadow(radius: 20)

                 }.alert(isPresented: $shown) {
                     return Alert(title: Text(self.msg))
                    }
                 }
             .padding(.horizontal, 18)
                 Spacer()
                Spacer()
             } .padding(.bottom, keyboard.currentHeight)
                    .edgesIgnoringSafeArea(.bottom)
                    .animation(.easeOut(duration: 0.16))
            }

        }.navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView().environment(\.colorScheme, .dark)
    }
}

struct SocialEatsTitleText: View {
    var body: some View {
        Text("Social Eats")
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}
