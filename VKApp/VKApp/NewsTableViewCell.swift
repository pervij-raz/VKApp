//
//  NewsTableViewCell.swift
//  VKApp
//
//  Created by Ольга Бычок on 30/01/2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    
    func setDataWith(_ article: Article) {
        newsLabel.text = article.text
        guard let urlString = article.photoURL, let url = URL(string: urlString) else {return}
        newsImageView.sd_setImage(with: url, completed: nil)
    }
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
