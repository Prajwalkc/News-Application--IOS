//
//  UserNewsViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/12/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import UserNotifications

class UserNewsViewController: UIViewController , UNUserNotificationCenterDelegate {
    @IBOutlet weak var myNewsTitle: UILabel!
    var index : Int = Int()
   var userNewsRef : [userNews] = []
    var sqlnew = SqlNew()
    
    @IBOutlet weak var myTableview: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      
        configHeader()
        configBody()
        
        UNUserNotificationCenter.current().delegate = self
        
        if UserDefaults.standard.bool(forKey: "isDeleted") {
            sendNotification(subtitle: "Successfully record deleted", body: "The data you want to delete is deleted successfully deleted")
            UserDefaults.standard.set(false, forKey: "isDeleted")
        }
        if UserDefaults.standard.bool(forKey: "newsUpdated") {
            sendNotification(subtitle: "Successfully record updated", body: "The data you want to update in updated successfully")
            UserDefaults.standard.set(false, forKey: "newsUpdated")
        }
          myTableview.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavButton()
        configHeader()
        
        configBody()
        
        // Do any additional setup after loading the view.
    }
    func setNavButton(){
        self.navigationItem.title = "News"
        let image = UIImage.init(named: "order.png")
        let button =  UIBarButtonItem.init(image: image, style: .done, target: self , action: #selector(handleSlide))
        navigationItem.setRightBarButton(button, animated: false)
        let righImage = UIImage.init(named: "feedback.png")
        navigationItem.backBarButtonItem?.title = ""
      let rightImage1 = UIImage.init(named: "rubbish.png")
        let righButton1 =  UIBarButtonItem.init(image: rightImage1, style: .done, target: self, action: #selector(deleteNews))
        let rightButton = UIBarButtonItem.init(image: righImage, style: .done, target: self, action: #selector(editNews))
      navigationItem.setRightBarButtonItems([righButton1,rightButton], animated: true)
         //navigationItem.setRightBarButton(rightButton, animated: true)
        
    }
    
    @objc func deleteNews(){
        print("i am ata add news")
        let alertAction = UIAlertAction.init(title: "sure", style: .default) { (action) in
            self.sqlnew.deleteNews(news_title: self.myNewsTitle.text!)
            UserDefaults.standard.set(true, forKey: "isDeleted")
        }
        let alert = UIAlertController.init(title: "Are your sure?", message: "The news will be deleted", preferredStyle: .alert)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    @objc func editNews(){
        
       
            let newsVC = self.storyboard?.instantiateViewController(withIdentifier: "updateVC") as! UpdateNewsViewController
        print(self.myNewsTitle.text)
        
        newsVC.news_title = self.myNewsTitle.text!
        self.present(newsVC, animated: true, completion: nil)
        
        
            
        
    }
    @objc func handleSlide(){
       
        print("i am at next button")
    }
    func configHeader(){
         myNewsTitle.text = userNewsRef[index].news_title
        myNewsAuthor.text = userNewsRef[index].userName
        myNewsPlace.text = userNewsRef[index].news_place
        myNewsDate.text = userNewsRef[index].news_date
    }
    func configBody(){
        myNewsBody.text = userNewsRef[index].news_body
        myNewsBody.sizeToFit()
    }
    @IBOutlet weak var myNewsDate: UILabel!
    @IBOutlet weak var myNewsPlace: UILabel!
    
    @IBOutlet weak var myNewsBody: UILabel!
    @IBOutlet weak var myNewsAuthor: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    func sendNotification(subtitle : String? , body : String?) {
        let content = UNMutableNotificationContent()
        content.title = " Success"
        content.subtitle = subtitle!
        content.body = body!
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1,
                                                        repeats: false)
        
        let requestIdentifier = "demoNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
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
