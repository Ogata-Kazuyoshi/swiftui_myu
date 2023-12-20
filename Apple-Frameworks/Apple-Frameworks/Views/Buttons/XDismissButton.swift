//
//  XDismissButton.swift
//  Apple-Frameworks
//
//  Created by user on 2023/12/17.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isShowningDetailView: Bool
    var body: some View {
        HStack{
            Spacer()
            Button{
                isShowningDetailView = false
            }label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }.padding()
    }
}


#Preview {
    XDismissButton(isShowningDetailView: .constant(false))
}
