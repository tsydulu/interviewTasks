//
//  CustomTableViewCell.swift
//  NewsDetailsApp
//
//  Created by SYDULU THAPPETLA on 14/12/19.
//  Copyright © 2019 SYDULU THAPPETLA. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let titleLabel:UILabel = {
        var title:UILabel = UILabel()
        return title
    }()
    
    let descriptTextView : UITextView = {
        var descrTextView = UITextView()
        return descrTextView
    }()
    
    let authorLabel : UILabel = {
        var authLabel = UILabel()
        return authLabel
    }()
    let dateLabel : UILabel = {
        var dateLabel = UILabel()
        return dateLabel
    }()
    
    let contentImageView : UIImageView = {
        var imgView = UIImageView()
        return imgView
    }()
    
    let contentTextView : UITextView = {
        var ContentText = UITextView()
        return ContentText
    }()
    
    let sourceLabel : UILabel = {
        let sourceLab = UILabel()
        return sourceLab
    }()
    
    let sourceUrl : UILabel = {
        var url = UILabel()
        return url
    }()
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(titleLabel)
        self.addSubview(descriptTextView)
        self.addSubview(authorLabel)
        self.addSubview(dateLabel)
        self.addSubview(contentImageView)
        self.addSubview(contentTextView)
        self.addSubview(sourceLabel)
        self.addSubview(sourceUrl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
   
}
