
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                HStack(spacing:12){
                    Text("\(coin.marketCapRank)")
                        .foregroundStyle(.gray)
                    VStack(alignment:.leading, spacing: 4){
                        Text(coin.name)
                            .fontWeight(.semibold)
                        Text(coin.symbol.capitalized)
                    }
                }
                .font(.footnote)
            }
        }
        .overlay{
            if let error = viewModel.errorMessage{
                Text(error).foregroundStyle(.red)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
