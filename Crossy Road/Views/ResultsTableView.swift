//
//  ResultsTableView.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import UIKit

class ResultsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var items: [TimeInterval] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.items = UserDefaults.standard.array(forKey: "results") as? [TimeInterval] ?? []
        items.sort { $0 > $1 }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        
        let resultFormatted = String(format: "%.1fs", items[indexPath.row])
        cell.textLabel?.text = "\(indexPath.row + 1). \(resultFormatted)"
        return cell
    }

}
