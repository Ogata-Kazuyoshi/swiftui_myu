//
//  BSViewModel.swift
//  BarcodeScanner
//
//  Created by user on 2023/12/17.
//

import SwiftUI

final class BSViewModel: ObservableObject{
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return  scannedCode.isEmpty ? .red : .green
    }
}
