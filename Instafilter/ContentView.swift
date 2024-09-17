//
//  ContentView.swift
//  Instafilter
//
//  Created by Naveed on 15/09/2024.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var image: Image?
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
                .onChange(of: pickerItem) {
                    Task {
                        selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                    }
                }
            
            selectedImage?
                .resizable()
                .scaledToFit()
            
            ShareLink(
                item: URL(string: "https://www.hackingwithswift.com")!,
                subject: Text("Link of Site"),
                message: Text("Pleaes open the link to Learn the Swift")
            )
        }
    }
    
    func loadImage() {
        let inputImage = UIImage(resource: .dp)
        let beginImage = CIImage(image: inputImage)
        // Apply filters
        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        currentFilter.inputImage = beginImage
        currentFilter.radius = 10
        // output CI Image
        guard let outputImage = currentFilter.outputImage else { return }
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
