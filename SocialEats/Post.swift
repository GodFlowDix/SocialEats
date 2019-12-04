//
//  Post.swift
//  SocialEats
//
//  Created by Mike Dix on 11/22/19.
//  Copyright © 2019 Mike Dix. All rights reserved.
//

import SwiftUI

struct Post: View {
    
    @State var imageData: Data = .init(capacity: 0)
    @State var show = false
    @State var imagepicker = false
    @State var source: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        
        NavigationView {
            
            
            ZStack {
                
                 LinearGradient(gradient: .init(colors: [Color("RentErm1"), Color("RentErm2")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                NavigationLink(destination: Imagepicker(show: $imagepicker, image: $imageData, source: source), isActive: $imagepicker) {
                    
                    Text("")
                }
        VStack {
            
            if imageData.count != 0 {
                Image(uiImage: UIImage(data: self.imageData)!).resizable().frame(width: 250, height: 250).cornerRadius(15)
            }
            Button(action: {
                
                self.show.toggle()
            }) {
                
                Text("Take a picture").foregroundColor(.white).padding()
            
            }.frame(width: 150)
            .background( LinearGradient(gradient: .init(colors: [Color("RentErm2"), Color("RentErm1")]), startPoint: .bottomLeading, endPoint: .topTrailing))
            .cornerRadius(18)
                .offset(y: 25)
            .shadow(radius: 20).navigationBarTitle("Share what you're eating today!", displayMode: .inline)
        }.actionSheet(isPresented: $show) {
            
            ActionSheet(title: Text("Select a type"), message: Text(""), buttons: [.default(Text("Upload"), action: {
                
                self.source = .photoLibrary
                self.imagepicker.toggle()
                
            }),.default(Text("Take a picture"), action: {
                
                self.source = .camera
                self.imagepicker.toggle()
                
            })])
                }
            }
        }
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        Post().environment(\.colorScheme, .dark)
            
        Post()
        }
    }
}


