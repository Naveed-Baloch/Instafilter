//
//  Filter.swift
//  Instafilter
//
//  Created by Naveed on 18/09/2024.
//

import Foundation
import CoreImage.CIFilterBuiltins

class Filter {
    let filter: CIFilter
    let name: String
    let icon: String
    
    init(_ filter: CIFilter,_ name: String,_ icon: String) {
        self.filter = filter
        self.name = name
        self.icon = icon
    }
}

