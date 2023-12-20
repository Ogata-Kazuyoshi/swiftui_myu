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
            ScrollView{
                LazyVGrid(columns: viewModel.columns){
                    ForEach(MockData.frameworks){ i in
                        FrameworkTitleView(item: i)
                            .onTapGesture {
                                viewModel.selectedFramework = i
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")// Ctr + Command + Space
            .sheet(isPresented: $viewModel.isShowningDetailView){
                FrameworkDetailView(
                    framework: viewModel.selectedFramework! ,
                    isShowningDetailView: $viewModel.isShowningDetailView) 
            }
        }
    }
}

//struct FrameworkTitleView: View{
//    let item: Framework
//    var body: some View{
//        VStack{
//            Image(item.imageName)
//                .resizable()
//                .frame(width: 90, height: 90)
//            Text(item.name)
//                .font(.title2)
//                .fontWeight(.semibold)
//                .scaledToFit()
//                .minimumScaleFactor(0.6)
//        }.padding()
//    }
//}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
