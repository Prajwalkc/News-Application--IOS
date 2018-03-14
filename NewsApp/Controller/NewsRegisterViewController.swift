//
//  NewsRegisterViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/11/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit


class NewsRegisterViewController: UIViewController {
     var sqlnew = SqlNew()
   
    @IBAction func myCacelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var myNews_title: UITextField!
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()

        myUserName.text = UserDefaults.standard.string(forKey: "userName")

     
    }
    @IBOutlet weak var myUserName: UILabel!
    @IBOutlet weak var myNewsDate: UITextField!
    
    @IBOutlet weak var myNewsID: UILabel!
  
    @IBOutlet weak var myNewsPlace: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var myNewsBody: UITextView!
    
    @IBAction func myNewsSubmitBtn(_ sender: Any) {
        if myNewsBody.text != "" && myNewsDate.text != "" && myNewsPlace.text != "" && myNews_title.text != "" {
            print("iam in news add section")
           
            sqlnew.addNewsInfo(userName: UserDefaults.standard.string(forKey: "userName")!, news_title: myNews_title.text!, news_date: myNewsDate.text!, news_body: myNewsBody.text!, news_place: myNewsPlace.text!)
                UserDefaults.standard.set(true, forKey: "newsRegistered")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
   
}
