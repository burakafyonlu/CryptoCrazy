//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Burak Afyonlu on 14.03.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var colorArray = [UIColor]()
    
    private var cryptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
        
            UIColor(displayP3Red: 100/255, green: 54/255, blue: 125/255, alpha: 1.0),
            UIColor(displayP3Red: 125/255, green: 125/255, blue: 15/255, alpha: 1.0),
            UIColor(displayP3Red: 234/255, green: 212/255, blue: 115/255, alpha: 1.0),
            UIColor(displayP3Red: 12/255, green: 12/255, blue: 221/255, alpha: 1.0),
            UIColor(displayP3Red: 150/255, green: 252/255, blue: 21/255, alpha: 1.0),
            UIColor(displayP3Red: 215/255, green: 152/255, blue: 5/255, alpha: 1.0)
            
        ]
        
        
        getData()
        
        let myString = "ıwjasdsd"
        myString.printMyName()
        
    }
    
   
    
    func getData() {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                    
                }
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        
        return cell
        
    }


}

