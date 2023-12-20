//
//import SwiftUI
//import RealityKit
//
//struct ContentView0 : View {
//    var body: some View {
//        ARViewContainer().edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct ARViewContainer: UIViewRepresentable {
//    @State private var imagesData: [[String: Any]] = [] // 結果を格納する変数
////    @State private var base64:String = ""
//    @State private var testUIImage = UIImage(systemName: "heart")!
//    let defaultimg = UIImage(systemName: "heart")!
//    
//    init(){
//        //base64コードをGET
//        getRequest { decodedImages in
////            self.imagesData = decodedImages
//            let base64 = decodedImages[3]["image_data"]! as! String
////            base64 = self.imagesData[3]["image_data"]! as! String
//            print("getRequest >>> base64 : \(base64)")
//            //UIImageの作成
//            guard let imageData = Data(base64Encoded: base64) else { return }
//            testUIImage = UIImage(data: imageData) ?? defaultimg
////            testUIImage = convertBase64ToImage(base64) ?? defaultimg
//            print("convertBase64ToImage >>> testUIImage : \(String(describing: testUIImage))")
//        }
//        
//        
//    }
//    
//    func makeUIView(context: Context) -> ARView {
//        print("----------------makeUIView start---------------")
//        //base64 -> UIImage変換処理する関数
////        func convertBase64ToImage(_ base64String: String) -> UIImage? {
////            guard let imageData = Data(base64Encoded: base64String) else { return nil }
////            return UIImage(data: imageData)
////        }
//        
//        let arView = ARView(frame: .zero)
//        
//        //AR表示するベースとなるボックスを作成
//        let box = ModelEntity(mesh: .generateBox(size: simd_make_float3(0.5, 0.5, 0)))
//        
//        //ローカルに保存するパスを指定
//        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("temp.png")
//        print("FileManager.default.urls >>> url : \(url)")
//        
//        
//        if let pngData = testUIImage.pngData(),
//           ((try? pngData.write(to: url)) != nil), // 一度ローカルに書き込む
//           let texture = try? TextureResource.load(contentsOf: url) { // 保存した画像のローカルURLからテクスチャリソースとして読み込む
//            var imageMaterial = UnlitMaterial()
//            imageMaterial.baseColor = MaterialColorParameter.texture(texture)
//            box.model?.materials = [imageMaterial]
//            print("Inside if ...")
//        }
//        
//        //アンカー設定。Create horizontal plane anchor for the content
//        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
//        anchor.children.append(box)//model->box変更した
//        
//        //Add the horizontal plane anchor to the scene
//        arView.scene.anchors.append(anchor)
//        print("----------------makeUIView end---------------")
//        return arView
//    }
//    func updateUIView(_ uiView: ARView, context: Context) {}
//}
//
////#Preview {
////    ContentView0()
////}
