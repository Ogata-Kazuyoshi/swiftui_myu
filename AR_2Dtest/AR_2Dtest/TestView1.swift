//
//  testView1.swift
//  AR_2Dtest
//
//  Created by user on 2023/12/20.
//

import SwiftUI

struct TestView1: View {
    var body: some View {
        VStack {
            Text("Top画面です")
            NavigationView {
                            List {
                                NavigationLink(destination: ContentView()
                                   ) {
                                        Image(systemName: "macpro.gen3.fill")
                                            .imageScale(.large)
                                        Text("AR画像を表示")


                                    }


                            }
                        }
        }
       
        
    }
}

#Preview {
    TestView1()
}
