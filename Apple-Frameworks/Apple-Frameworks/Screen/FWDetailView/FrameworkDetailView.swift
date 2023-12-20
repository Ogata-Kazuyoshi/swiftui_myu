//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by user on 2023/12/16.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    @Binding var isShowningDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack{
            XDismissButton(isShowningDetailView: $isShowningDetailView)
            Spacer()
            FrameworkTitleView(item: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            Button{
                isShowingSafariView = true
            }label:{
                AFButton(title: "Learn More")
            }
        }.fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
            // not Modal, but Fullscreen!
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowningDetailView: .constant(false))
}
