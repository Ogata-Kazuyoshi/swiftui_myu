//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by user on 2023/12/16.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(MockData.frameworks){ i in
                    NavigationLink(
                        destination:
                            FrameworkDetailView(
                                framework: i,
                                isShowningDetailView: $viewModel.isShowningDetailView))
                    {
                        FrameworkTitleView(item: i)
                    }
                }
            }.navigationTitle("🍎 Frameworks")// Ctr + Command + Space
        }.accentColor(Color(.label))
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
