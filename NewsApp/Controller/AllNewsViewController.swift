//
//  AllNewsViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/12/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit


class AllNewsViewController: UIViewController {
    var newsListRef : [userNews] = []
    var index : Int = Int()
    @IBOutlet weak var myNewsDate: UILabel!
    @IBOutlet weak var myTabelView: UITableView!
    
    @IBOutlet weak var myBodyLabel: UILabel!
    @IBOutlet weak var myNewsPlace: UILabel!
    
    @IBOutlet weak var myNewsAuthor: UILabel!
    @IBOutlet weak var myNewsTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "News"
      configHeader()
        configBody()
        // Do any additional setup after loading the view.
    }
    func configHeader(){
        myNewsTitle.text = newsListRef[index].news_title!
        myNewsDate.text = newsListRef[index].news_date!
        myNewsAuthor.text! = newsListRef[index].userName!
        myNewsPlace.text! =  newsListRef[index].news_place!
        
    }
    func configBody(){
        myBodyLabel.text! = newsListRef[index].news_body!
       
        myBodyLabel.sizeToFit()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
