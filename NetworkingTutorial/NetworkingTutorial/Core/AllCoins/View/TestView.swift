
import SwiftUI

struct TestView: View {
    var viewModel2 = TestModel()
    var body: some View {
        Text("Test Mode")
            .frame(width: 200, height: 200)
            .font(.title)
            .fontWeight(.bold)
            .background(.yellow)
    }
}
//struct TestView2: View {
//    let image: Image
//    init () {
//        let uiImage = UIImage(systemName: "house.fill")
//        image = Image(uiImage: uiImage!)
//    }
//
//    var body: some View {
//        VStack {
//            image
//                .resizable()
//                .frame(width: 100, height: 100)
//        }
//    }
//}

//#Preview {
//    TestView()
//}
