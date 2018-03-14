//
//  UserViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/10/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController
import UserNotifications

class UserViewController: UIViewController , UNUserNotificationCenterDelegate , UITableViewDelegate , UITableViewDataSource{
  
    var userOnlyNewsList : [userNews] = []
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        userOnlyNewsList.removeAll()
        for u in userNewslist {
            
            if u.userName == userNameLabel.text! {
                userOnlyNewsList.append(u)
            }
  
        }
    return userOnlyNewsList.count
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let usernewsVC = self.storyboard?.instantiateViewController(withIdentifier: "usernewsVC") as! UserNewsViewController
        usernewsVC.index = indexPath.row
        usernewsVC.userNewsRef = self.userOnlyNewsList
        self.navigationController?.pushViewController(usernewsVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UsersNewsTableViewCell
        cell.myNewsTitleLabel.text = userOnlyNewsList[indexPath.row].news_title
        cell.myNewsAuthor.text = userOnlyNewsList[indexPath.row].userName
        cell.myNewsDateLabel.text = userOnlyNewsList[indexPath.row].news_date

        return cell
    }
    
var sqlnew = SqlNew()
    var users : [UserInfo] = []
    var userNewslist : [userNews] = []
    
 
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
         SJSwiftSideMenuController.hideLeftMenu()
        setNavButton()
      check()
        
        
        users =  sqlnew.listUserInforamtion()
        userNewslist = sqlnew.listNewsInformation()
       
        if UserDefaults.standard.bool(forKey: "newsRegistered") {
            sendNotification()
            UserDefaults.standard.set(false, forKey: "newsRegistered")
        }
       
        if UserDefaults.standard.bool(forKey: "newsUpdated") {
            sendNotification()
            UserDefaults.standard.set(false, forKey: "newsUpdated")
        }
        configLabel()
      
      
        
        print("hello there")
         userNameLabel.text = UserDefaults.standard.string(forKey: "userName")
         myTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        myTableView.delegate = self
        myTableView.dataSource = self
        
       
             UNUserNotificationCenter.current().delegate = self
        
       
        
        // Do any additional setup after loading the view.
    }
    func configLabel(){
   
        for u in users{
            if u.userName == UserDefaults.standard.string(forKey: "userName"){
        ageLabel.text = u.age
        nameLabel.text = u.name
            userNameLabel.text = u.userName
            addressLabel.text = u.address
                contactNoLabel.text = u.contactNo
        }
        }
     
    }
   
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var contactNoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func check(){
        if   !UserDefaults.standard.bool(forKey: "isLoggedIn")
        {
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! ViewController
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
    func setNavButton(){
        self.navigationItem.title = "User Profile"
        let image = UIImage.init(named: "order.png")
        let button =  UIBarButtonItem.init(image: image, style: .done, target: self , action: #selector(handleSlide))
        navigationItem.setLeftBarButton(button, animated: false)
        let righImage = UIImage.init(named: "file.png")
        let rightButton = UIBarButtonItem.init(image: righImage, style: .done, target: self, action: #selector(addNews))
        navigationItem.setRightBarButton(rightButton, animated: true)
        
    }
    @objc func addNews(){
        print("i am ata add news")
        print(users.count)
        for u in users{
            print(u.userName!)
            if u.userName == userNameLabel.text {
                let newsVC = self.storyboard?.instantiateViewController(withIdentifier: "newsVC") as! NewsRegisterViewController
                self.present(newsVC, animated: true, completion: nil)
            }
            
        }
    }
    @objc func handleSlide(){
        SJSwiftSideMenuController.toggleLeftSideMenu()
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = " Success"
        content.subtitle = "Successfully  News Registered"
        content.body = "Thank you for the registration .You have successfully registered the news. PLEASE CHECK THE NEWS LIST "
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1,
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
