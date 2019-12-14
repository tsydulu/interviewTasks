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
    
    
    var mainTitle : UILabel = {
        var mainLbl = UILabel(frame: CGRect(x: 50, y: 50, width: 300, height: 50))
        mainLbl.textAlignment = .center
        mainLbl.textColor = .green
        mainLbl.shadowColor = .gray
        mainLbl.text = "Todays News"
        mainLbl.font = UIFont.boldSystemFont(ofSize: 50)
        return mainLbl
    }()
    
    let API_KEY = "e86589f7d9a946698a7d2bee66767a47"
    var newsTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(mainTitle)
        creatTableView()
        dataFromServer()
    }
    
    //creating tableview
    func creatTableView(){
        newsTableView = UITableView(frame: CGRect(x: 0, y: 125, width: view.frame.width, height: view.frame.height-50), style: .plain)
        view.addSubview(newsTableView)
        
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
                    print(val.urlToImage ?? "NO NAME")
                    self.titleArr.append(val.title!)
                    self.descrptiveArr.append(val.descriptionField ?? "NO DESCRIPTION")
                    self.authorNamesArr.append(val.author ?? "NO NAME")
                    self.dateArr.append(val.publishedAt!)
                    self.imageArr.append(val.urlToImage ?? "https://images.barrons.com/im-93753/social")
                    self.contentArr.append(val.content ?? "NO_CONTENT")
                    self.sourceArr.append((val.source?.name)!)
                    self.sourceURLArr.append(val.url!)
                }
                
                DispatchQueue.main.sync {
                      self.newsTableView.delegate = self
                      self.newsTableView.dataSource = self
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
        cell.selectionStyle = .blue
      
        cell.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.descriptTextView.text = descrptiveArr[indexPath.row]
        cell.authorLabel.text = "By \(authorNamesArr[indexPath.row])"
        cell.dateLabel.text = dateArr[indexPath.row]
        
        if(imageArr[indexPath.row] == "http://s.marketwatch.com/public/resources/MWimages/MW-GF332_broadc_ZG_20180312185441.jpg"){
            imageArr.remove(at: indexPath.row)
            imageArr.append("https://images.wsj.net/im-136403/social")
        }
        
        cell.contentImageView.image = try! UIImage(data: Data(contentsOf: URL(string: "\(imageArr[indexPath.row])")!))
        cell.contentTextView.text = contentArr[indexPath.row]
        cell.sourceLabel.text = "Source-\(sourceArr[indexPath.row])"
        cell.sourceUrl.text = "Source_URL - \(sourceURLArr[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 820
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

