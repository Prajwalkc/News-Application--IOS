//
//  UpdateNewsViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/13/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit


class UpdateNewsViewController: UIViewController {
    var sqlnew = SqlNew()
    var news_title = ""
    override func viewWillAppear(_ animated: Bool) {
       print(news_title)
        myNewsTitle.text = news_title
    }
    @IBAction func myCacelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBOutlet weak var myNewsTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myUserName.text = UserDefaults.standard.string(forKey: "userName")
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var myUserName: UILabel!
    @IBOutlet weak var myNewsDate: UITextField!
    
    @IBOutlet weak var myNewsPlace: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var myNewsBody: UITextView!
    
    @IBAction func myNewsSubmitBtn(_ sender: Any) {
        if myNewsBody.text != "" && myNewsDate.text != "" && myNewsPlace.text != "" && myNewsTitle.text != "" {
            print("iam in news add section")
            
            sqlnew.updateNewsInfo(userName: UserDefaults.standard.string(forKey: "userName")!, news_title: myNewsTitle.text!, news_date: myNewsDate.text!, news_body: myNewsBody.text!, news_place: myNewsPlace.text!)
            UserDefaults.standard.set(true, forKey: "newsUpdated")
           
             self.dismiss(animated: true, completion: nil)
        }
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

