//
//  QuoteCell.swift
//  Project7-DataStorage
//
//  Copyright © 2023 Бейбарыс Шагай. All rights reserved.
//

import UIKit

final class QuoteCell: UITableViewCell {

     @IBOutlet weak var iconImageView: UIImageView!
       
       @IBOutlet private var nameLabel: UILabel!
       @IBOutlet private var symbolLabel: UILabel!
       @IBOutlet private var priceLabel: UILabel!
       @IBOutlet private var supllyLabel: UILabel!
       
       func configure(with quote: Quote) {
        if let url = URL(string: quote.logoUrl ?? "") {
                   iconImageView.sd_setImage(with: url)
               } else {
                   iconImageView.image = nil
               }
           nameLabel.text = quote.name
           symbolLabel.text = quote.symbol
           priceLabel.text = quote.price
           supllyLabel.text = quote.maxSupply
       }

}
