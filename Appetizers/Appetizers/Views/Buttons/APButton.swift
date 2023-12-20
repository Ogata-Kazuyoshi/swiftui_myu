//
//  APButton.swift
//  Appetizers
//
//  Created by user on 2023/12/17.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary1)
            .cornerRadius(10)
    }
}

#Preview {
        APButton(title: "Test Title")
}
