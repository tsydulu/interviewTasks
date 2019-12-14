//
//  ViewController.swift
//  NewsDetailsApp
//
//  Created by SYDULU THAPPETLA on 14/12/19.
//  Copyright © 2019 SYDULU THAPPETLA. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    
    var newsTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        creatTableView()
    }
    
    //creating tableview
    func creatTableView(){
        newsTableView = UITableView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height-50), style: .plain)
        view.addSubview(newsTableView)
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        // registerig tableview
        
        newsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    // tableview delegate and datasource func's
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}

