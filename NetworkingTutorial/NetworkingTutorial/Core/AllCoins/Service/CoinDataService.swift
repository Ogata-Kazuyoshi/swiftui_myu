
import Foundation

class CoinDataService {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=5&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: urlString) else { return [] }
        
        print("DEBUG: Fetching data...")
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let coins = try JSONDecoder().decode([Coin].self, from: data)
            return coins
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
        }
    }
}

// MARK: - Completion Handlers

extension CoinDataService {
    func fetchCoinsWithResult(completion: @escaping(Result<[Coin], CoinAPIError>) -> Void){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in // hand in back thred
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else{
                completion(.failure(.requestFialed(description: "Request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.requestFialed(description: String(httpResponse.statusCode))))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(.success(coins))
            } catch {
                print("DEBUG: Failed to decode with error \(error)")
                completion(.failure(.jsonParsingFailure))
            }
        }.resume()
    }
    
    func fetchPrice(coin:String, completion:@escaping(Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            // print("Thread.current 1 : \(Thread.current)")
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                // self.errorMessage = error.localizedDescription
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else{
                // self.errorMessage = "Bad HTTP Response !"
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                // self.errorMessage = "Status Code : \(httpResponse.statusCode)"
                return
            }
            
            print("DEBUG: httpResponse.statusCode - \(httpResponse.statusCode)")
            
            guard let data = data else { return }
            print("data  : \(data)")
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else { return }
            print("jsonObject : \(type(of:jsonObject)) , \(jsonObject)")
            guard let value = jsonObject[coin] as? [String:Double] else {
                print("Failed to parsing")
                return
            }
            print("value : \(value)")
            guard let price = value["usd"] else { return }
            print("price : \(price)")
            completion(price)
        }.resume()
    }
}
