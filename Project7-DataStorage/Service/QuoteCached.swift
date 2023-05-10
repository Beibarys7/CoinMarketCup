//
//  QuoteCached.swift
//  Project7-DataStorage
//
//  Created by Бейбарыс Шагай on 12/12/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import Foundation
import RealmSwift

final class QuoteCached {
    
    func saveQuote(_ quotes: [Quote]) {
        do {
            let realm = try! Realm()
            try! realm.write {
                realm.add(quotes)
            }
        } catch {
            print(error)
        }
    }
    
    func getQuote() -> [Quote]? {
        do {
            let realm = try Realm()
            let results = realm.objects(Quote.self)
            return Array(results)
        } catch {
            print(error)
        }
        
        return nil
    }
}
