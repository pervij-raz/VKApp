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
    
    var news: [Article]?

    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = VKSdk.initialize(withAppId: "7298901")
        VKSdk.wakeUpSession(["email", "wall", "friends", "offline"]) {[weak self] (state, error) in
            self?.isLogggedIn = state == .authorized
            if !(self?.isLogggedIn ?? false) {
                self?.authorization()
            }
        }    }
  
        
    }
    
    
    extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
            return cell
        }
        
        
    }
