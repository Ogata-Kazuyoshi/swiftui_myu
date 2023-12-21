
import SwiftUI
import RealityKit


struct ContentView : View {
    var body: some View {
        Text("aaaa")
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

// struct ARViewContainer: UIViewRepresentable {
//     let defaultimg = UIImage(systemName: "heart")!
//     let arView = ARView(frame: .zero)
    
//     func makeUIView(context: Context) -> ARView {
//         getRequest { decodedImages in
//             print("- - - - - - - - - - - - - - - - - - - - - - - ")
//             let base64 = decodedImages[2]["image_data"]! as! String
//             print("getRequest >>> base64 : \(base64)")
//             print("- - - - - - - - - - - - - - - - - - - - - - - ")
            
//             //AR表示するベースとなるボックスを作成
//             let box = ModelEntity(mesh: .generateBox(size: simd_make_float3(0.5, 0.5, 0)))
            
//             //base64->UIImage変換する関数
//             func convertBase64ToImage(_ base64String: String) -> UIImage? {
//                 guard let imageData = Data(base64Encoded: base64String) else { return nil }
//                 return UIImage(data: imageData)
//             }
            
//             let testUIImage = convertBase64ToImage(base64)//UIImageの作成
            
//             //ローカルに保存するパスを指定
//             let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("temp.png")
//             print("url : \(url)")
            
//             if let uiImage = testUIImage,
//                let pngData = uiImage.pngData(),
//                ((try? pngData.write(to: url)) != nil), // 一度ローカルに書き込む
//                let texture = try? TextureResource.load(contentsOf: url) { // 保存した画像のローカルURLからテクスチャリソースとして読み込む
//                 var imageMaterial = UnlitMaterial()
//                 imageMaterial.baseColor = MaterialColorParameter.texture(texture)
//                 box.model?.materials = [imageMaterial]
//             }
            
//             //アンカー設定。Create horizontal plane anchor for the content
//             let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
//             anchor.children.append(box)//model->box変更した
            
//             //Add the horizontal plane anchor to the scene
//             arView.scene.anchors.append(anchor)
//         }
//         return arView
//     }
//     func updateUIView(_ uiView: ARView, context: Context) {}
// }
struct ARViewContainer: UIViewRepresentable {
    let defaultimg = UIImage(systemName: "heart")!
    let arView = ARView(frame: .zero)
    
    func makeUIView(context: Context) -> ARView {
        setupARView()
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func setupARView() {
        Task {
//            do {
                let decodedImages =  await apiImageGetRequest()
                let base64 = decodedImages[2]["image_data"]! as! String
                func convertBase64ToImage(_ base64String: String) -> UIImage? {
                                 guard let imageData = Data(base64Encoded: base64String) else { return nil }
                                 return UIImage(data: imageData)
                             }
                let testUIImage = convertBase64ToImage(base64)
                let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("temp.png")
                
                if let uiImage = testUIImage,
                   let pngData = uiImage.pngData(),
                   ((try? pngData.write(to: url)) != nil),
                   let texture = try? await TextureResource.load(contentsOf: url) {
                    DispatchQueue.main.async {
                        let box = ModelEntity(mesh: .generateBox(size: simd_make_float3(0.5, 0.5, 0)))
                        var imageMaterial = UnlitMaterial()
                        imageMaterial.baseColor = MaterialColorParameter.texture(texture)
                        box.model?.materials = [imageMaterial]
                        
                        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
                        anchor.children.append(box)
                        
                        arView.scene.anchors.append(anchor)
                    }
                }
//            } catch {
//                // エラーハンドリング
//            }
        }
    }
}
