//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by user on 2023/12/16.
//

import SwiftUI

class FrameworkGridViewModel: ObservableObject{
    // Optional:since at start, it's not selected
    var selectedFramework: Framework?{
        didSet{ isShowningDetailView = true }
    }
    
    @Published var isShowningDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
