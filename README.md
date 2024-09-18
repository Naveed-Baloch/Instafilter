# Instafilter

Instafilter is an app that lets users import images from their photo library, apply a variety of image effects using Core Image, and then save or share the edited images. Built using SwiftUI and UIKit, this app demonstrates how to manipulate images using Apple's powerful Core Image framework and integrate SwiftUI with UIKit components.

## Features

- **PhotoPickers**: Allows users to import images from their photo library seamlessly.
- **Core Image Filters**: Apply various effects like blurs, color shifts, pixellation, and more using GPU-optimized Core Image filters.
- **Image Handling**: Manage different image types like `CGImage`, `UIImage`, and `CIImage` for smooth image manipulation and display.
- **ShareLink**: Easily share edited images with other apps or services through the iOS share sheet.
- **UIKit Integration**: Learn how to combine SwiftUI with UIKit to access essential features that don’t have SwiftUI wrappers yet.

## Key Learnings

This project focuses on two major areas:
- **Core Image Framework**: Apple’s high-performance framework for applying GPU-accelerated image effects.
- **UIKit and SwiftUI Integration**: While SwiftUI is Apple's future, UIKit is still widely used. This project teaches you how to combine both to leverage the full power of iOS development.

> **Note**: The app runs best on a physical device as Core Image filters are optimized for the GPU. Performance in the simulator may be slower.

## Screenshots
| Empty Screen | Editing Screen | Sharing Screen |
| :-: | :-: | :-: |
| <img src="https://github.com/user-attachments/assets/a286f59c-ec57-447e-9f50-91b424eb2d67" width="400"/> | <img src="https://github.com/user-attachments/assets/7a5d20a6-6f87-42e5-8941-b3b4de5972cc" width="400"/> | <img src="https://github.com/user-attachments/assets/f4309f14-48b4-4439-a975-6388589eedcd" width="400"/> |

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/naveed-baloch/instafilter.git
    ```
2. Open the project in Xcode:
    ```sh
    cd instafilter
    open Instafilter.xcodeproj
    ```
3. Build and run the app on your simulator or device.

## Usage

1. **Import a Photo**: Tap the "Select Image" button to pick an image from your library using the built-in `PhotoPicker`.
2. **Apply Filters**: Use the available Core Image filters to modify your image.
3. **Save or Share**: After editing, you can either save the image to your library or share it with other apps using the `ShareLink`.

## Contributing

1. Fork the repository.
2. Create your feature branch:
    ```sh
    git checkout -b feature/AmazingFeature
    ```
3. Commit your changes:
    ```sh
    git commit -m 'Add some AmazingFeature'
    ```
4. Push to the branch:
    ```sh
    git push origin feature/AmazingFeature
    ```
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Hacking with Swift](https://www.hackingwithswift.com/100) - for the 100 Days of SwiftUI course, which inspired the project.
- Thanks to Apple for providing the powerful Core Image framework and tools for building iOS apps.
