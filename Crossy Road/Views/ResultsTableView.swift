//
//  ResultsTableView.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import UIKit

class ResultsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var items: [String] = ["14.5s", "28.3s", "59.9s"]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
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
        cell.textLabel?.text = "\(indexPath.row + 1). \(items[indexPath.row])"
        return cell
    }

}
