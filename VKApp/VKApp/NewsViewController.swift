//
//  NewsViewController.swift
//  VKApp
//
//  Created by Ольга Бычок on 28/01/2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import UIKit
import VK_ios_sdk

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.loadData(handler: { self.tableView.reloadData()})
    }

  
        
    }
    
    
    extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return NetworkManager.shared.articles?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? NewsTableViewCell, let article = NetworkManager.shared.articles?[indexPath.row] else {fatalError()}
            cell.setDataWith(article)
            return cell
        }
        
        
    }
