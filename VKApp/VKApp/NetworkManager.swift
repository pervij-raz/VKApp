//
//  NetworkManager.swift
//  VKApp
//
//  Created by Ольга Бычок on 29/01/2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import Foundation
import VK_ios_sdk
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
    }
    
    var token: String? {
        return UserDefaults.standard.string(forKey: "token")
    }
    
    var articles: [Article]? = []
    
    func loadData(handler: @escaping ()-> Void) {
        guard let token = token else {return}
        let urlString = "https://api.vk.com/method/newsfeed.get?filters=post&count=50&access_token=\(token)&v=5.103"
        guard let url = URL(string: urlString) else {return}
        AF.request(url).responseJSON {[weak self] response in
            guard let error = response.error else {
                let data = response.value as? [String:Any]
                let response = data?["response"] as? [String: Any]
                guard let items = response?["items"] as? [[String:Any]] else {return}
                for item in items {
                    let article = Article(array: item)
                    self?.articles?.append(article)
                }
                handler()
                return
            }
            print(error.localizedDescription)
        }
    }
    
    
    
    
    
}
