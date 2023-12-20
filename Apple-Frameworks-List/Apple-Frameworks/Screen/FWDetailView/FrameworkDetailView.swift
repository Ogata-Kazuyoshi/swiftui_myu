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
            Spacer()
            FrameworkTitleView(item: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            Button{
                isShowingSafariView = true
            }label:{
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
//            .foregroundColor(.yellow)
//            .buttonBorderShape(.roundedRectangle(radius: 20))
            .buttonBorderShape(.capsule)
            .tint(.red)
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
            // not Modal, but Fullscreen!
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowningDetailView: .constant(false))
}
