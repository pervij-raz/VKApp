//
//  Article.swift
//  VKApp
//
//  Created by Ольга Бычок on 29/01/2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import Foundation

class Article: Codable {
    var text: String?
    var photoURL: String?
    
    init(array: [String: Any]) {
        self.text = array["text"] as? String
        let attachments = array["attachments"] as? [[String:Any]]
        let attachment = attachments?.first
        if attachment?["type"] as? String == "photo" {
            let photo = attachment?["photo"] as? [String:Any]
            let sizes = photo?["sizes"] as? [[String:Any]]
            self.photoURL = sizes?.last?["url"] as? String
        }
    }
}
