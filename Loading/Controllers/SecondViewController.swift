//
//  ViewController.swift
//  Loading
//
//  Created by Mateus Rodrigues on 09/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        triggerLoading(in: navigationItem, duration: 2.0)
    }
    
    @IBAction func action(_ sender: Any) {
        if let button = navigationItem.rightBarButtonItem {
           triggerLoading(in: button)
        }
    }
    
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Action \(indexPath.row)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            triggerLoading(in: cell)
        }
    }
    
}
