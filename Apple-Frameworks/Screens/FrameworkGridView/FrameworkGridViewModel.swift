//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by RaulF on 29/7/21.
//

import SwiftUI

final class FrameworGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView = false
    @Published var isGridView = true

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    func toggleGridView() {
        isGridView.toggle()
    }
}
