//
//  DisplayViewController.swift
//  NewsDetailsApp
//
//  Created by SYDULU THAPPETLA on 16/12/19.
//  Copyright © 2019 SYDULU THAPPETLA. All rights reserved.
//

import UIKit
import WebKit

class DisplayViewController: UIViewController {
    var web:WKWebView!
    var url:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(url)
        navigationItem.title = "Todays News"
        createweb()
        // Do any additional setup after loading the view.
    }
    
    func createweb(){
        web = WKWebView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height-50))
        web.load(URLRequest(url: URL(string: "\(url!)")!))
        view.addSubview(web)
    }
    

  

}
