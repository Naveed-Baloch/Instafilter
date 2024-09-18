import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
import StoreKit
import PhotosUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.0
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @Environment(\.colorScheme) private var colorScheme
    let context = CIContext()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                        .padding()
                } else {
                    ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                }
                Spacer()
                
                VStack {
                    HStack {
                        Text("Intensity")
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity) { applyProcessing() }
                            .disabled(processedImage == nil)
                    }
                    .padding(.horizontal)
                    
                    FilterPickerView { filter in
                        loadImage(filter: filter)
                    }
                    .disabled(processedImage == nil)
                }
                .padding(.bottom)
                
            }
            .navigationTitle("Instafilter")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Image(systemName: "photo.on.rectangle.angled")
                    }
                    .onChange(of: selectedItem) { loadImage() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: saveImage) {
                            Image(systemName: "square.and.arrow.down")
                        }
                        .disabled(processedImage != nil)
                        
                        if let processedImage {
                            ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage)) {
                                Image(systemName: "square.and.arrow.up")
                            }
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func loadImage(filter: CIFilter? = nil) {
        Task {
            filterIntensity = 0.0
            var inputImage: UIImage?
            if filter != nil {
                guard let outputImage = currentFilter.outputImage else { return }
                guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
                inputImage = UIImage(cgImage: cgImage)
            } else {
                guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
                inputImage = UIImage(data: imageData)
            }
            
            guard let inputImage = inputImage else { return }
            let beginImage = CIImage(image: inputImage)
            
            if let newFilter = filter {
                currentFilter = newFilter
            }
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            processedImage = Image(uiImage: uiImage)
        }
    }
    
    func saveImage() {
        //Todo will be added soon :)
    }
}

#Preview {
    ContentView()
}
