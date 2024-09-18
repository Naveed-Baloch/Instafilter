//
//  FitlerPickerView.swift
//  Instafilter
//
//  Created by Naveed on 18/09/2024.
//

import Foundation
import SwiftUI

struct FilterPickerView: View {
    let filters = CustomFilters.filters
    @State private var selectedFilterIndex = 0
    let onSelectFilter: (CIFilter) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(filters.indices, id: \.self) { index in
                    VStack {
                        Image(systemName: filters[index].icon)
                            .font(.system(size: 30))
                            .foregroundColor(selectedFilterIndex == index ? .blue : .primary)
                        Text(filters[index].name)
                            .font(.caption)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(selectedFilterIndex == index ? Color.blue.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedFilterIndex == index ? Color.blue : Color.clear, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedFilterIndex = index
                        onSelectFilter(filters[index].filter)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
