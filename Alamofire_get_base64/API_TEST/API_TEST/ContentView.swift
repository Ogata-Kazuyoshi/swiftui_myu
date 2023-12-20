
import SwiftUI

struct ContentView: View {
    // 「struct」とは異なり、「class」の場合はプロパティは変更可能の仕様になるので、「@State」は不要です。
    @State private var imagesData: [[String: Any]] = [] // 結果を格納するための変数
    @State private var photoIsOn = false // GETした画像を表示するかどうか決める変数
    @State private var img = UIImage(systemName: "star")!
    let defaultimg = UIImage(systemName: "heart")!
    
    // Base64を画像データ(UIImage)に変換する関数
    func convertBase64ToImage(_ base64String: String) -> UIImage? {
        guard let imageData = Data(base64Encoded: base64String) else { return nil }
        print("converting... \(type(of:imageData)) : \(imageData)")
        return UIImage(data: imageData)
    }
    
    init() {
        print("----------------init start---------------")
        //        testUIImage = convertBase64ToImage(sample640) ?? defaultimg //UIImageの作成
        //        print("testUIImage : \(type(of:testUIImage))")
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("temp.png")
        print("url : \(url)")
        print("----------------init end---------------")
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")// Imageの表示テスト
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Button {
                getRequest { decodedImages in
                    self.imagesData = decodedImages
                    let a = self.imagesData[3]["image_data"]!
                    print("a : \(type(of:a))")
                    img = convertBase64ToImage(a as! String) ?? defaultimg
//                    guard img == convertBase64ToImage(a as! String)! else { return }
//                    img = await??? convertBase64ToImage(a as! String) ?? defaultimg
                    print("img : \(String(describing: img))")
                    self.photoIsOn.toggle() // バグ：非同期処理終了前に画面遷移
                }
            } label : {
                Text("画像をGETして表示")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.green))
                    .cornerRadius(10)
            }.sheet(isPresented: $photoIsOn) {
                Image(uiImage: img)
                Text("⭐️マークが表示された場合は")
                Text("戻ってもう一度ボタンをクリック！")
            }
        }
    }
}

#Preview {
    ContentView()
}
