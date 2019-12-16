//
//  CustomTableViewCell.swift
//  NewsDetailsApp
//
//  Created by SYDULU THAPPETLA on 14/12/19.
//  Copyright © 2019 SYDULU THAPPETLA. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    //creating required components
    
    
    
    let titleLabel:UILabel = {
        var title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let descriptTextView : UITextView = {
        var descrTextView = UITextView()
        descrTextView.font = UIFont.boldSystemFont(ofSize: 20)
        descrTextView.isEditable = false
        descrTextView.textAlignment = .center
        descrTextView.translatesAutoresizingMaskIntoConstraints = false
        return descrTextView
    }()
    
    let authorLabel : UILabel = {
        var authLabel = UILabel()
        authLabel.textColor = .black
        authLabel.translatesAutoresizingMaskIntoConstraints = false
        return authLabel
    }()
    let dateLabel : UILabel = {
        var dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    let contentImageView : UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let contentTextView : UITextView = {
        var ContentText = UITextView()
        ContentText.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        ContentText.font = UIFont.systemFont(ofSize: 20)
        ContentText.textAlignment = .natural
        ContentText.isEditable = false
        ContentText.translatesAutoresizingMaskIntoConstraints = false
        return ContentText
    }()
    
    let sourceLabel : UILabel = {
        let sourceLab = UILabel()
        sourceLab.translatesAutoresizingMaskIntoConstraints = false
        return sourceLab
    }()
    
    let sourceUrl : UILabel = {
        var url = UILabel()
        url.numberOfLines = 0
        url.translatesAutoresizingMaskIntoConstraints = false
        return url
    }()
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.layer.borderWidth = 4
        self.contentView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = 20
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        
        addSubview(titleLabel)
        addSubview(descriptTextView)
        addSubview(authorLabel)
        addSubview(dateLabel)
        addSubview(contentImageView)
        addSubview(contentTextView)
        addSubview(sourceLabel)
        //self.addSubview(sourceUrl)
        
        constrintsForComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //creating constraints
    
    func constrintsForComponents(){
        titleLabel.widthAnchor.constraint(equalToConstant: 400).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        
        
        
        authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: authorLabel.trailingAnchor, constant: 15).isActive = true
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        
        descriptTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 5).isActive = true
        descriptTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        descriptTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        descriptTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        
        contentImageView.topAnchor.constraint(equalTo: descriptTextView.bottomAnchor, constant: 5).isActive = true
        contentImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        contentImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        //contentImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        contentImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        contentTextView.topAnchor.constraint(equalTo: contentImageView.bottomAnchor, constant: 5).isActive = true
        contentTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        contentTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        contentTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        
        sourceLabel.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 5).isActive = true
        sourceLabel.widthAnchor.constraint(equalToConstant: 400).isActive = true
        sourceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sourceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        
//        sourceUrl.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 5).isActive = true
//        sourceUrl.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        sourceUrl.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        sourceUrl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
    }
    
    
   
}
