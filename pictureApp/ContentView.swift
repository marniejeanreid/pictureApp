//
//  ContentView.swift
//  pictureApp
//
//  Created by scholar on 5/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary

    @State var isPickerShowing = false
    @State var selectedImage : UIImage?
   // @State var isCameraShowing = false
    
    var body: some View {
        VStack {
            
            Image(uiImage: selectedImage ?? UIImage(named: "heartCamera")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        
            HStack (spacing: 50){
                Button("Select a Photo") {
                    //Show the ImagePicker
                    self.sourceType = .photoLibrary
                    isPickerShowing = true
                }
                
                Button("Take a Photo") {
                    //Show the Camera
                    self.sourceType = .camera
                    isPickerShowing = true
                }
            }
        }
        .sheet(isPresented: $isPickerShowing) {
            //ImagePicker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing, sourceType: self.sourceType)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
