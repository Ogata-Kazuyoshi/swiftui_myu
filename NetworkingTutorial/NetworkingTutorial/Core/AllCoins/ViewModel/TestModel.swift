
import Foundation

class TestModel: ObservableObject{
    init(){
        let test1 = toBase64(word: "Can you change me to Base64 ???")
        let test2 = fromBase64(word: test1)
        print("Base64 : \(test1)")
        print("String : \(test2)")
        print("- - - - - - - - - - - - - - - - ")
        fetchAPI()
    }
    
    // https://youtu.be/54qejmgrLZQ?si=Ur_QfedpiKXoJvi6
    func toBase64(word: String) -> String{
        let base64Encoded = word.data(using: String.Encoding.utf8)!.base64EncodedString()
        return base64Encoded
    }
    func fromBase64(word:String) -> String{
        let base64Decoded = Data(base64Encoded: word)!
        let decodedString = String(data:base64Decoded, encoding: .utf8)!
        return decodedString
    }
    
    
    func fetchAPI(){
        let urlString = "https://drawingtraveler-server.onrender.com/api/v1/images"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            print("data : \(data)")
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) else { return }
            print("jsonObject : \(type(of:jsonObject))") // print("jsonObject : \(jsonObject)")
            
            // NSArrayの要素はAny型であるため、取り出す際に適切な型へキャストする必要がある
            let arr:[Any] = jsonObject as! [Any]
            print("arr : \(type(of:arr))")
            
            guard let obj = arr[0] as? [String:Any] else {
                print("Failed to parsing")
                return
            }
            print("obj : \(obj)")
            guard let img = obj["image_data"] else { return }
            print("image_data : \(img)")
            print("- - - - - - - - - - - - - - - - ")
        }.resume()
    }

    
}
