//
//  Quote.swift
//  Project7-DataStorage
//
//  Copyright © 2023 Бейбарыс Шагай. All rights reserved.
//

import Foundation
import RealmSwift

final class Quote: Object, Decodable {
      
    @objc dynamic var id : String?
    @objc dynamic var currency : String?
    @objc dynamic var symbol : String?
    @objc dynamic var name : String?
    @objc dynamic var logoUrl : String?
    @objc dynamic var status : String
    @objc dynamic var price : String
    @objc dynamic var priceDate : String?
    @objc dynamic var priceTimestamp : String?
    @objc dynamic var circulatingSupply : String?
    @objc dynamic var maxSupply : String?
    @objc dynamic var marketCap : String?
    @objc dynamic var numExchanges : String?
    @objc dynamic var numPairs : String?
    @objc dynamic var numPairsUnmapped : String?
    @objc dynamic var firstCandle : String?
    @objc dynamic var firstTrade : String?
    @objc dynamic var firstOrderBook : String?
    @objc dynamic var rank : String?
    @objc dynamic var rankDelta : String?
    @objc dynamic var high : String?
    @objc dynamic var highTimestamp : String?
    
      
      enum CodingKeys: String, CodingKey {
          case id
          case currency
          case symbol
          case name
          case status
          case price
          case logoUrl = "logo_url"
          case priceDate = "price_date"
          case priceTimestamp = "price_timestamp"
          case circulatingSupply = "circulating_supply"
          case maxSupply = "max_supply"
          case marketCap = "market_cap"
          case numExchanges = "num_exchanges"
          case numPairs = "num_pairs"
          case numPairsUnmapped = "num_pairs_unmapped"
          case firstCandle = "first_candle"
          case firstTrade = "first_trade"
          case firstOrderBook = "first_order_book"
          case rank
          case rankDelta = "rank_delta"
          case high
          case highTimestamp = "high_timestamp"
          
      }
}
