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
  //  @ObservedObject var observedData = getData()
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
                           BreakfastView()
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
                          
                   
                               BrunchView()
                               
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
                                       
                           //ForEach(0..<5) {_ in
                                  
                               LunchView()
                           //    }
                           }
                       }
                   }.padding()
                   
                   Divider()

                   Group {
                       HStack {
                           DinnerTitle()
                           Spacer()
                           NavigationLink(destination: SeeAllBreakfast()) {
                               Text("See all").foregroundColor(universalOrange)
                           }
                       }
                   ScrollView(.horizontal, showsIndicators: false) {
                       HStack {
                        
                         //  ForEach(0..<5) {_ in
                                  
                               DinnerView()
                             //  }
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
                                                       
                          // ForEach(0..<5) {_ in
                                                 
                               SnackView()
                              // }
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
                                                         
                         //  ForEach(0..<5) {_ in
                                           
                               DesertView()
                           //    }
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
                          // ForEach(0..<5) {_ in
                               DrinkView()
                           //}
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
    
//    @Binding var showPost : Bool
//    @State var txt : String
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
                    //multilineTextField(txt: $ingredients)
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

//struct multilineTextField : UIViewRepresentable {
//    @Binding var showPost : Bool
//    @State var txt : String
//
//    func makeCoordinator() -> multilineTextField.Coordinator {
//
//        return multilineTextField.Coordinator(parent1: self)
//    }
//
//    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<multilineTextField>) {
//
//    }
//
//
//    func makeUIView(context: UIViewRepresentableContext<multilineTextField>) -> UITextView {
//
//        let text = UITextView()
//        text.isEditable = true
//        text.isUserInteractionEnabled = true
//        text.text = "Type Ingredients"
//        text.textColor = .gray
//        text.font = .systemFont(ofSize: 20)
//        text.delegate = context.coordinator
//            return text
//        }
//
//    class Coordinator : NSObject, UITextViewDelegate {
//
//        var parent : multilineTextField
//
//        init(parent1: multilineTextField) {
//
//            parent = parent1
//        }
//        func textViewDidBeginEditing(_ textView: UITextView) {
//            textView.text = ""
//            textView.textColor = .black
//        }
//
//        func textViewDidChange(_ textView: UITextView) {
//            self.parent.txt = textView.text
//        }
//    }
//    }





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


struct MealPost: Identifiable {
    var id: String = ""
    var mealDetails: String = ""
    var ingredients: String = ""
    var flames: String = ""
    var pic: String = ""
    var url: String = ""
    var tagId: String = ""
    
    init(id: String, desc: String, url:String, ingre: String, proPic: String) {
        self.id = id
        self.mealDetails = desc
        self.url = url
        self.ingredients = ingre
        self.pic = proPic
    }
    
    init() {
    }
}

class DataManager : ObservableObject {
    
    @Published var meals = [MealPost]()
    
    init() {
        
        self.meals.append(MealPost(id: "Alice", desc: "Big Mac", url: "brunch", ingre: "This contains everything on a big mac plus cheese!", proPic: "profilePicture"))
        self.meals.append(MealPost(id: "Tom", desc: "Mac & Cheese", url: "lunch", ingre: "This contains everything needed to make mac & cheese!", proPic: "mike"))
        self.meals.append(MealPost(id: "Bob", desc: "Fried Chicken", url: "dinner", ingre: "This contains everything needed for fried chicken!", proPic: "tae"))
        self.meals.append(MealPost(id: "John", desc: "Watermelon", url: "snack", ingre: "Watermelon with some sugar!", proPic: "renan"))
        self.meals.append(MealPost(id: "Smith", desc: "Crab Legs", url: "drink", ingre: "Crab legs butter and ole bay!! Can't go wrong!", proPic: "darius"))
        
        
        let db = Firestore.firestore()
     
         
        db.collection("breakfastPost").addSnapshotListener {(snap, err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            print(snap)
            
            self.meals.removeAll()
            
            for item in snap!.documentChanges {
                
                if item.type == .added {
                    
                    var mealItem = MealPost()
                    mealItem.id = item.document.documentID
                    mealItem.mealDetails = item.document.get("description") as! String
                    mealItem.ingredients = item.document.get("ingredients") as! String
                    mealItem.flames = item.document.get("flames") as! String
                    mealItem.pic = item.document.get("pic") as! String
                    //let tagID = i.document.get("id") as! String
                    
                    self.meals.append(mealItem)
                    
                    
                    /*
                    DispatchQueue.main.async {
                        
                        self.meals.append(MealPost(id: id, description: description, ingredients: ingredients, flames: flames, pic: pic, tagId: tagID))
                    }
 */
                }
            }
            
            
            
        }
        
    }
}
