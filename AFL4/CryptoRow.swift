//
//  CryptoRow.swift
//  AFL4
//
//  Created by Macbook Pro on 30/05/22.
//

import SwiftUI

struct CryptoRow: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack {
            CoinImageView(coin: coin)
                .frame(width: 35, height: 35)
            VStack (alignment: .leading) {
                Text(coin.name).font(.headline)
                Text(coin.symbol.uppercased()).font(.caption).foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack (alignment: .trailing) {
                Text("\(coin.currentPrice.asCurrencyWith4Decimals())")
                Text("\(coin.priceChangePercentage24H?.asPercentString() ?? "")")
                    .foregroundColor(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ?
                            .green :
                                .red
                        
                    )
            }
            
        }
        .padding(.horizontal)
        .background(.gray.opacity(0.001))
    }
}

struct CryptoRow_Previews: PreviewProvider {
    static var previews: some View {
        CryptoRow(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
    }
}
