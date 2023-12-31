
import SwiftUI
import RealityKit


struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
//    @State private var testUIImage = UIImage(systemName: "heart")!
    let defaultimg = UIImage(systemName: "heart")!
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        getRequest { decodedImages in
            print("- - - - - - - - - - - - - - - - - - - - - - - ")
            let base64 = decodedImages[3]["image_data"]! as! String // 画像データを選択
            print("getRequest >>> base64 : \(base64)")
            print("- - - - - - - - - - - - - - - - - - - - - - - ")
            guard let imageData = Data(base64Encoded: base64) else { return } // base64をデコード
            let testUIImage = UIImage(data: imageData) ?? defaultimg // UIImageに変換
            print("convertBase64ToImage >>> testUIImage : \(String(describing: testUIImage))")
            print("- - - - - - - - - - - - - - - - - - - - - - - ")
        }
        
        //AR表示するベースとなるボックスを作成
        let box = ModelEntity(mesh: .generateBox(size: simd_make_float3(0.5, 0.5, 0)))
        
        //base64コードを仮置き（ハートマーク）
        let base64:String = "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"
        
        //base64->UIImage変換する関数
        func convertBase64ToImage(_ base64String: String) -> UIImage? {
            guard let imageData = Data(base64Encoded: base64String) else { return nil }
            return UIImage(data: imageData)
        }
        
        //UIImageの作成
        let testUIImage = convertBase64ToImage(base64)
        
        //ローカルに保存するパスを指定
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("temp.png")
        print("url : \(url)")
        
        
        
        if let uiImage = testUIImage,
           let pngData = uiImage.pngData(),
           ((try? pngData.write(to: url)) != nil), // 一度ローカルに書き込む
           let texture = try? TextureResource.load(contentsOf: url) { // 保存した画像のローカルURLからテクスチャリソースとして読み込む
            var imageMaterial = UnlitMaterial()
            imageMaterial.baseColor = MaterialColorParameter.texture(texture)
            box.model?.materials = [imageMaterial]
        }
        
        
        
        
        
        
        //アンカー設定。Create horizontal plane anchor for the content
        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
        anchor.children.append(box)//model->box変更した
        
        
        //Add the horizontal plane anchor to the scene
        arView.scene.anchors.append(anchor)
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}
