//
//  CryptoViewModel.swift
//  CryptoCrazy
//
//  Created by Burak Afyonlu on 14.03.2023.
//

import Foundation

struct CryptoListViewModel {
    
    let cryptoCurrencyList : [CryptoCurrency]
}

extension String {
    func printMyName() {
        print("Burak Afyonlu")
    }
}

extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
}

extension CryptoViewModel {
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}
