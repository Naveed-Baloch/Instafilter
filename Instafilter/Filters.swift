//
//  Filters.swift
//  Instafilter
//
//  Created by Naveed on 18/09/2024.
//

import Foundation
import CoreImage.CIFilterBuiltins

struct CustomFilters {
    static let filters: [Filter] = [
        Filter(CIFilter.sepiaTone(), "Sepia", "camera.filters"),
        Filter(CIFilter.gaussianBlur(), "Blur", "drop"),
        Filter(CIFilter.crystallize(), "Crystallize", "leaf"),
        Filter(CIFilter.vignette(), "Vignette", "camera.aperture"),
        Filter(CIFilter.sharpenLuminance(), "Sharpen", "plus.magnifyingglass"),
        Filter(CIFilter.unsharpMask(), "Unsharp Mask", "arrowtriangle.up.square"),
        Filter(CIFilter.bumpDistortion(), "Bump", "circle.circle"),
        Filter(CIFilter.twirlDistortion(), "Twirl", "tornado"),
        Filter(CIFilter.colorMonochrome(), "Monochrome", "square.fill")
    ]
}
