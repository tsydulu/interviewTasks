//
//  ViewController.swift
//  NewsDetailsApp
//
//  Created by SYDULU THAPPETLA on 14/12/19.
//  Copyright © 2019 SYDULU THAPPETLA. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var titleArr = [String]()
    var descrptiveArr = [String]()
    var authorNamesArr = [String]()
    var dateArr = [String]()
    var imageArr = [String]()
    var contentArr = [String]()
    var sourceArr = [String]()
    var sourceURLArr = [String]()
    
    
    
    
    let API_KEY = "e86589f7d9a946698a7d2bee66767a47"
    var newsTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        creatTableView()
        dataFromServer()
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
    
    //getting the data from servers
    
    func dataFromServer(){
        var urlReq = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(API_KEY)")!)
        urlReq.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlReq) { (data, resp, err) in
            
            guard let data = data else {
                return
            }
            
            print(data)
            do{
                print("data coming")
                let jsonData = try JSONDecoder().decode(RootClass.self, from: data)
                //print(jsonData.articles!.compactMap({ ($0.author) }))
               
                
                for val in jsonData.articles!{
                    print(val.author ?? "NO NAME")
                    self.titleArr.append(val.title!)
                    self.descrptiveArr.append(val.descriptionField ?? "NO DESCRIPTION")
                    self.authorNamesArr.append(val.author ?? "NO NAME")
                    self.dateArr.append(val.publishedAt!)
                    self.imageArr.append(val.urlToImage ?? "NO_URL")
                    self.contentArr.append(val.content ?? "NO_CONTENT")
                    self.sourceArr.append((val.source?.name)!)
                    self.sourceURLArr.append(val.url!)
                }
                
                DispatchQueue.main.sync {
                    self.newsTableView.reloadData()
                }
                
                
                
            }catch{
                print("something is wromg \(String(describing: err?.localizedDescription))")
            }
            
            
        }.resume()
    }
    
    
    // tableview delegate and datasource func's
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authorNamesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.descriptTextView.text = descrptiveArr[indexPath.row]
        cell.authorLabel.text = authorNamesArr[indexPath.row]
        cell.dateLabel.text = dateArr[indexPath.row]
        cell.contentImageView.image = UIImage(named: imageArr[indexPath.row])
        cell.contentTextView.text = contentArr[indexPath.row]
        cell.sourceLabel.text = sourceArr[indexPath.row]
        cell.sourceUrl.text = sourceURLArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 390
    }
}

