//
//  QuoteDetailViewController.swift
//  Project7-DataStorage
//
//  Copyright © 2023 Бейбарыс Шагай. All rights reserved.
//

import Foundation

import UIKit

final class QuoteDetailViewController: UIViewController {

    @IBOutlet private  var logoImageView: UIImageView!
    @IBOutlet private  var rankLabel: UILabel!
    @IBOutlet private  var nameLabel: UILabel!
    @IBOutlet private  var symbolLabel: UILabel!
    @IBOutlet private  var quoteIdLabel: UILabel!
    @IBOutlet private  var statusLabel: UILabel!
    @IBOutlet private  var currencyLabel: UILabel!
    @IBOutlet private  var circulatingSupplyLabel: UILabel!
    @IBOutlet private  var priceLabel: UILabel!
    @IBOutlet private  var maxSupplyLabel: UILabel!
    @IBOutlet private  var priceDateLabel: UILabel!
    @IBOutlet private  var marketCapLabel: UILabel!
    @IBOutlet private  var priceTimestampLabel: UILabel!
    @IBOutlet private  var numExchangesLabel: UILabel!
    @IBOutlet private  var numPairsLabel: UILabel!
    @IBOutlet private  var firstCandleLabel: UILabel!
    @IBOutlet private  var firstTradeLabel: UILabel!
    @IBOutlet private  var firstOrderBookLabel: UILabel!
    @IBOutlet private  var rankDeltaLabel: UILabel!
    @IBOutlet private  var highLabel: UILabel!
    @IBOutlet private  var highTimestampLabel: UILabel!
    
    var quote: Quote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            if let quote = quote {
                self.title = quote.name
                let nav = self.navigationController?.navigationBar
                  
                    // 2
                    nav?.barStyle = UIBarStyle.black
                    nav?.tintColor = UIColor.yellow
                  
                    // 3
                    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                    imageView.contentMode = .scaleAspectFit
                
                    // 4
                if let url = URL.init(string: quote.logoUrl ?? "") {
                    logoImageView?.sd_setImage(with: url)
                } else {
                    logoImageView.image = nil
                }
                     5
                    navigationItem.titleView = logoImageView
                
                self.title = quote.name
                nameLabel.text = quote.name
                if let url = URL(string: quote.logoUrl ?? "") {
                    logoImageView.sd_setImage(with: url)
                } else {
                    logoImageView.image = nil
                }
                print("logoUrl = \(quote.logoUrl)")
                print("name=\(quote.name)")
                rankLabel.text = quote.rank
                print("rank=\(quote.rank)")
                symbolLabel.text = quote.symbol
                print("symbol=\(quote.symbol)")
                quoteIdLabel.text = quote.id
                print("id=\(quote.id)")
                statusLabel.text = quote.status
                print("status=\(quote.status)")
                currencyLabel.text = quote.currency
                print("currency=\(quote.currency)")
                circulatingSupplyLabel.text = String(describing: quote.circulatingSupply?.description)
                print("circulatingSupply=\(quote.circulatingSupply)")
                priceLabel.text = quote.price
                print("price=\(quote.price)")
                maxSupplyLabel.text = quote.maxSupply
                print("maxSupply=\(quote.maxSupply)")
                priceDateLabel.text = quote.priceDate
                print("priceDate=\(quote.priceDate)")
                marketCapLabel.text = quote.marketCap
                print("marketCap=\(quote.marketCap)")
                priceTimestampLabel.text = quote.priceTimestamp
                print("priceTimestamp=\(quote.priceTimestamp)")
                numExchangesLabel.text = quote.numExchanges
                print("numExchanges=\(quote.numExchanges)")
                numPairsLabel.text = quote.numPairs
                print("numPairs=\(quote.numPairs)")
                firstCandleLabel.text = quote.firstCandle
                print("firstCandle=\(quote.firstCandle)")
                firstTradeLabel.text = quote.firstTrade
                print("firstTrade=\(quote.firstTrade)")
                firstOrderBookLabel.text = quote.firstOrderBook
                print("firstOrderBook=\(quote.firstOrderBook)")
                rankDeltaLabel.text = quote.rankDelta
                print("rankDelta=\(quote.rankDelta)")
                highLabel.text = quote.high
                print("high=\(quote.high)")
                highTimestampLabel.text = quote.highTimestamp
                print("highTimestamp=\(quote.highTimestamp)")
        }
    }
}
