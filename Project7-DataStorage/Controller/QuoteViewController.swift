//
//  QuoteViewController.swift
//  Project7-DataStorage

//  Copyright © 2023 Бейбарыс Шагай. All rights reserved.
//

import RealmSwift
import UIKit
import SDWebImage

final class QuoteViewController: UITableViewController {

    private var quote: Quote?
    private var quotes =  [Quote]()
    private let quoteCached = QuoteCached()
    private let activityIndicator = UIActivityIndicatorView(style: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromCache()
        
        alertAction()
        
        stepupViews()
    }
    
    func getDataFromCache() {
        if let quotes = quoteCached.getQuote(), !quotes.isEmpty {
            DispatchQueue.main.async {
                self.quotes = quotes
                print("cache keldi dannylar!!!")
                print("quotes=\(quotes)")
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }
        } else {
            getQuotes { quotes in
                DispatchQueue.main.async {
                    self.quotes = quotes
                    self.tableView.reloadData()
                    print("else quote keldi dannylar!!!")
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // console count 1,2,3 launch
    // -> "Lauch counter = 7"
    func alertAction() {
        let key = "1strun"
        guard !UserDefaults.standard.bool(forKey: key) else { return }
        UserDefaults.standard.set(true, forKey: key)
        let alert = UIAlertController(title: "Launch application", message: "This is an Launch", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }

    private func stepupViews() {
           tableView.addSubview(activityIndicator)
           activityIndicator.translatesAutoresizingMaskIntoConstraints = false
           activityIndicator.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
           activityIndicator.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
       }
    
    func getQuotes(completion: @escaping ([Quote]) -> Void) {
        activityIndicator.isHidden = false // когда из API берем данные анимация будет виден
        activityIndicator.startAnimating()
        let urlString = "https://api.nomics.com/v1/currencies/ticker?key=3c8c0907276523d0ff0e94c50657de0c&format=json&interval=5m&convert=USD"
        let url = URL(string: urlString)!
        let dataTask = URLSession.shared.dataTask(with: url) {(data, response, error) in
            // data то что приходить из запроса
            // мы должны получить или выташить данные из этого data
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                  let quotes = try jsonDecoder.decode([Quote].self, from: data)
                    self.quoteCached.saveQuote(quotes)
                    completion(quotes) //
                } catch {
                    print(error.localizedDescription)
                }
            }

            if let error = error {
                print(error)
            }
        }
        dataTask.resume()
         
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as? QuoteCell {
            
            let index = indexPath.row
            let quote = quotes[index]
            cell.configure(with: quote)
            return cell
        }

        return QuoteCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                   if segue.identifier == "quoteToDetail",
                       let cell = sender as? QuoteCell,
                       let indexPath = tableView.indexPath(for: cell),
                       let detailVC = segue.destination as? QuoteDetailViewController {
                       detailVC.quote = quotes[indexPath.row]
                   }
               }
    
}
