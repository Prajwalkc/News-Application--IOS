//
//  DashBoardTableViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/3/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import SJSwiftSideMenuController

class DashBoardTableViewController: UITableViewController {
    var sqlnew = SqlNew()
    var records : [eSmartData] = []
    var username : String = ""
    override func viewWillAppear(_ animated: Bool) {
        
         SJSwiftSideMenuController.hideLeftMenu()
        setNavbar()
    }
    func setNavbar(){
        let image = UIImage.init(named: "order.png")
        let button =  UIBarButtonItem.init(image: image, style: .done, target: self, action: #selector(handleSlide))
        navigationItem.setLeftBarButton(button, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "eSmart News"
        fetchData()
       
        //userAuth()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
   
   
    

    @IBOutlet var myTableView: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 @objc func handleSlide(){
    SJSwiftSideMenuController.toggleLeftSideMenu()
    }
    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count
    }

    @available(iOS 2.0, *)
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "eSmartCell", for: indexPath) as! eSmartTableViewCell
        
        let url = URL.init(string: records[indexPath.row].featured_img!)
        cell.myImageView.kf.setImage(with: url)
        cell.myImageView.layer.cornerRadius = (cell.myImageView.layer.frame.width)/2
        cell.myImageView.clipsToBounds = true
        cell.myLabelEng.text = records[indexPath.row].content_title
        cell.myLabelArab.text = records[indexPath.row].content_title_ar
        return cell
    }
    @available(iOS 2.0, *)
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let eSmartVC = self.storyboard?.instantiateViewController(withIdentifier: "eSmartVC") as! eSmartNewsViewController
        eSmartVC.records = self.records
        eSmartVC.newsIndex = indexPath.row
        self.navigationController?.pushViewController(eSmartVC, animated: true)
    }
   
    func fetchData(){
        let param : [String:Any] = [
            "token" : "147258369123456789"
            ,"content_type" : "News"
        ]
        Alamofire.request("http://esmart.almawadait.com/api/content/lists", method: .post, parameters: param).responseJSON { (response) in
            print(response)
            if let responseData = response.value as? NSDictionary {
                if let responseArray = responseData["records"] as? NSArray {
                    for eachElement in responseArray{
                         let singleValue = eachElement as! NSDictionary
                        self.records.append(eSmartData.init(json: singleValue))
                        print(singleValue)
                    }
                  self.myTableView.reloadData()
                }
               
            }
            
        }
   
    }
}
