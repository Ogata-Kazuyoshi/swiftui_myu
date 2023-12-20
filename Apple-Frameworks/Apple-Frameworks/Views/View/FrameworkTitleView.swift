//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by user on 2023/12/17.
//

import SwiftUI

struct FrameworkTitleView: View{
    let item: Framework
    var body: some View{
        VStack{
            Image(item.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(item.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }.padding()
    }
}

#Preview {
    FrameworkTitleView(item: MockData.sampleFramework)
}
