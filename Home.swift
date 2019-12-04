//
//  Home.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI
import Firebase

struct Home: View {
    // @State var isNavigationBarHidden: Bool = true
    @State var show = false
    @State var showModalView = false
   var body: some View {
       NavigationView {
          // ZStack {
              // LinearGradient(gradient: .init(colors: [Color("RentErm2"), Color("RentErm1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        HStack {
            ScrollView(.vertical, showsIndicators: false) {
               
               VStack {
                   
                   Group {
                    Divider()//.padding(.bottom)
                       HStack {
                           BreakfastTitle()
                           Spacer()
                           NavigationLink(destination: SeeAllBreakfast()) {
                               Text("See all").foregroundColor(universalOrange)
                           }
                       }.padding(.top, 25)
                       ScrollView(.horizontal, showsIndicators: false) {
                       HStack {
                           ForEach(0..<5) {_ in
                               BreakfastView()
                           }
                       }
                   }
                    
                   }.padding()
                   
                   Divider()
                   
                   Group {
                       HStack {
                           BrunchTitle()
                       Spacer()
                       NavigationLink(destination: SeeAllBrunch()) {
                           Text("See all").foregroundColor(universalOrange)
                       }
                   }
                   ScrollView(.horizontal, showsIndicators: false) {
                       HStack {
                               ForEach(0..<5) {_ in
                   
                               BrunchView()
                               }
                           }
                       }
                   }.padding()
                   
                   Divider()
                   
                   Group {
                       HStack {
                           LunchTitle()
                           Spacer()
                           NavigationLink(destination: SeeAllLunch()) {
                               Text("See all").foregroundColor(universalOrange)
                           }
                       }
                   ScrollView(.horizontal, showsIndicators: false) {
                       HStack {
                                       
                           ForEach(0..<5) {_ in
                                  
                               LunchView()
                               }
                           }
                       }
                   }.padding()
                   
                   Divider()

                   Group {
                       HStack {
                           DinnerTitle()
                           Spacer()
                           NavigationLink(destination: SeeAllDinner()) {
                               Text("See all").foregroundColor(universalOrange)
                           }
                       }
                   ScrollView(.horizontal, showsIndicators: false) {
                       HStack {
                                          
                           ForEach(0..<5) {_ in
                                  
                               DinnerView()
                               }
                           }
                       }
                        Divider()
                   }.padding()
                   
                  

                   Group {
                       HStack {
                           SnackTitle()
                           Spacer()
                           NavigationLink(destination: SeeAllSnack()) {
                               Text("See all").foregroundColor(universalOrange)
                           }
                       }
                   ScrollView(.horizontal, showsIndicators: false) {
                       HStack {
                                                       
                           ForEach(0..<5) {_ in
                                                 
                               SnackView()
                               }
                           }
                       }
                       Divider()
                   }.padding()
                   
                  // Divider()

                   Group {
                       HStack {
                           DesertTitle()
                           Spacer()
                           NavigationLink(destination: SeeAllDesert()) {
                               Text("See all").foregroundColor(universalOrange)
                           }
                       }
                   ScrollView(.horizontal, showsIndicators: false) {
                       HStack {
                                                         
                           ForEach(0..<5) {_ in
                                           
                               DesertView()
                               }
                           }
                       }
                        Divider()
                   }.padding()
                   
               

                   Group {
                       HStack {
                           DrinkTitle()
                           Spacer()
                           NavigationLink(destination: SeeAllDrink()) {
                               Text("See all").foregroundColor(universalOrange)
                           }
                       }
                   ScrollView(.horizontal, showsIndicators: false) {
                       HStack {
                           ForEach(0..<5) {_ in
                               DrinkView()
                           }
                               }
                           }
                        Divider()
                       }.padding()
                   }
               
            }.navigationBarTitle("Social Eats")
                .navigationBarItems(leading:
                    Button(action: {
                         self.showModalView.toggle()
                    }) {
                    Image(systemName: "camera").foregroundColor(universalOrange)
                    }, trailing: Image(systemName: "gear").foregroundColor(universalOrange)
                    .contextMenu {
                        Button(action: {
//                            do {
//                                try Auth.auth().signOut()
//                            } catch {
//
//                            }
                           
                        }) {
                            Text("Sign Out")
                            Image(systemName: "pencil.and.outline")
                        }
                    }
            
//                        HStack {
//                            Button(action: {
//
//                            }) {
//                        Image("settings").resizable().frame(width: 30, height: 30)
//
//                            }.foregroundColor(Color("darkAndWhite"))
//                               .contextMenu {
//                                Text("test")
//                            }
//                        }
            ).sheet(isPresented: $showModalView, content: { ModalView(isPresented: self.$showModalView) })
               
                
                .navigationBarBackButtonHidden(true)
        }
         //.navigationBarHidden(true)
           // .edgesIgnoringSafeArea([.top, .bottom])
       }
   }
              

       }
  // }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        Home()
        Home().environment(\.colorScheme, .dark)
        }
    }
}


struct ModalView: View {
    @Binding var isPresented: Bool
    
    @State var description = ""
    @State var ingredients = ""
    @State var location = ""
    
    @State private var typeOfMealIndex = 0
    var typesOfMeals = ["Breakfast", "Brunch", "Lunch", "Dinner", "Snack", "Dessert", "Drink"]
    
    @State var selectedImage = UIImage()
    
  //  @State var typeOfMeal
    
    @State var imageData: Data = .init(capacity: 0)
       @State var show = false
       @State var imagepicker = false
       @State var source: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("RentErm2"), Color("RentErm1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)

            
            NavigationLink(destination: Imagepicker(show: $imagepicker, image: $imageData, source: source), isActive: $imagepicker) {
                
                Text("")
            }
            
            VStack {
                
        
                HStack {
                    Text("Share a meal!")
                            .fontWeight(.bold)
                        .font(.system(size: 32))
                    Spacer()
                }.padding(.leading, 15)
                 
                
                HStack {
                    
                    if imageData.count != 0 {
                    Image(uiImage: UIImage(data: self.imageData)!).resizable().frame(width: 280, height: 280).cornerRadius(15)
                    }
                    
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Text("Take a picture").foregroundColor(.white).padding()
                    }.frame(width: 150)
                    .background( LinearGradient(gradient: .init(colors: [Color("RentErm2"), Color("RentErm1")]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .cornerRadius(18)
                        .offset(y: 25)
                        .shadow(radius: 20).padding(.bottom, 25)
                    }.actionSheet(isPresented: $show) {
                
                ActionSheet(title: Text("Select a type"), message: Text(""), buttons: [.default(Text("Upload"), action: {
                    
                    self.source = .photoLibrary
                    self.imagepicker.toggle()
                    
                }),.default(Text("Take a picture"), action: {
                    
                    self.source = .camera
                    self.imagepicker.toggle()
                    
                })])
                    }
                
                HStack {
                    Text("Description")
                    TextField("Enter the name of this food", text: $description)
                }.padding(.leading, 15)
                HStack {
                    Text("Ingredients")
                    TextField("Enter the ingredients for this meal", text: $ingredients)
                }.padding(.leading, 15)
                 //  ZStack {
                HStack {
                  
                    
                   
                        
                   // Form {
                        
                Section {
                    
                    Picker(selection: $typeOfMealIndex, label: Text("Meal")) {
                        
                        ForEach(0 ..< typesOfMeals.count) {
                            Text(self.typesOfMeals[$0]).tag($0)
                        
                        // }
                     //   }
                        }
                    }.padding(.trailing, 15)

                    }.padding(.leading, 15)
                }
            
                VStack {
                    Button(action: {
                        
                    }) {
                        Text("Post")
                            .foregroundColor(Color(.white))
                    }
                    .padding(.vertical, 11.0)
                    .frame(width: 91.0)
                    .background(Color(.black))
                    .cornerRadius(15.0)
                    
                    Button(action: {
                        self.isPresented.toggle()
                    }) {
                        Text("Cancel")
                            .foregroundColor(Color("darkAndWhite"))
                    }
                    .padding(.vertical, 11.0)
                }
            }
           
        }
    }
}


struct Imagepicker: UIViewControllerRepresentable {
 

 
 @Binding var show: Bool
 @Binding var image: Data
 var source: UIImagePickerController.SourceType
 
 func makeUIViewController(context: UIViewControllerRepresentableContext<Imagepicker>) -> UIImagePickerController {
     
     let controller = UIImagePickerController()
     controller.sourceType = source
     controller.delegate = context.coordinator
     return controller
 }
    
    func makeCoordinator() -> Imagepicker.Coordinator {
        return Imagepicker.Coordinator(self)
    }
 
 func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Imagepicker>) {
     
 }
 
 class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
     var parent: Imagepicker
     
     init(_ parent1: Imagepicker) {
         
        self.parent = parent1
     }
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         
         self.parent.show.toggle()
     }
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         
         let image = info[.originalImage] as! UIImage
         let data = image.pngData()
         self.parent.image = data!
         self.parent.show.toggle()
     }
 }
}

