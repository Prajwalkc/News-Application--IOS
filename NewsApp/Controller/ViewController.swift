//
//  ViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/3/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//
import SJSwiftSideMenuController
import UIKit
import UserNotifications
import SQLite
 let alert = Alert()

class ViewController: UIViewController ,UNUserNotificationCenterDelegate{
 
    var sqlnew = SqlNew()
    var users : [UserInfo] = []
    let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    
    

    override func viewWillAppear(_ animated: Bool) {
         SJSwiftSideMenuController.hideLeftMenu()
        if UserDefaults.standard.bool(forKey: "isRegistered") {
            sendNotification()
            UserDefaults.standard.set(false, forKey: "isRegistered")
        }
        //sqlobject.openDatabase()
        self.navigationController?.isNavigationBarHidden = true
        myNameTextField.isEnabled = true
         users = sqlnew.listUserInforamtion()
        print(users.count)
        print("I am at view will appear")
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageConfig()
//        buttonConfig()
        UNUserNotificationCenter.current().delegate = self
            }
   
    
    
    
    @IBOutlet weak var myPasswordTextField: UITextField!
    @IBOutlet weak var myNameTextField: UITextField!
    
    
    @IBAction func myRegisterButtonPressed(_ sender: Any) {
        let userInfoVC = self.storyboard?.instantiateViewController(withIdentifier: "userInfoVC") as! userInfoRegisterViewController
        self.navigationController?.present(userInfoVC, animated: true, completion: nil)
    }
    @IBAction func myButtonPressed(_ sender: Any) {
        
        
      
        if myPasswordTextField.text != "" && myNameTextField.text! != "" {
           
                    print("I M at Login")
                print(users.count)
                var count = 0
                    for u in users
                    {
                      print(u.userName!)
                        print(u.name!)
                        print(u.address!)
                        print(u.password!)
                
                       if u.userName! == myNameTextField.text! && u.password! == myPasswordTextField.text! {
                        print("i am  logged hai")
                        
                        
                            let userVC = self.storyboard?.instantiateViewController(withIdentifier: "userVC") as! UserViewController
                         UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        UserDefaults.standard.set(myNameTextField.text!, forKey: "userName")
                            self.navigationController?.pushViewController(userVC, animated: true)
                        
                          count = count + 1
                       }
            }
                    
                    if count != 1 {
                    self.present(alert.alertNotify(title: "Error", message: "There is no data in the database"), animated: true, completion: nil)
                    }
            
            }
        
        else
        {
         self.present(alert.alertNotify(title: "Error", message: "Please enter the Name and password to continue"), animated: true, completion: nil)
        }
    
    }
    


    @IBOutlet weak var myButtonLabel: UIButton!
    @IBOutlet weak var mySegment: UISegmentedControl!
    @IBOutlet weak var myDisplayImage: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func buttonConfig(){
//        myButtonLabel.layer.cornerRadius = 15
//        myButtonLabel.setTitle("Login", for: .normal)
//        mySegment.addTarget(self, action: #selector(changeButtonLabel), for: .valueChanged)
//        }
//
//    @objc func changeButtonLabel(){
//        if mySegment.selectedSegmentIndex == 0{
//            myButtonLabel.setTitle("Login", for: .normal)
//        }else{
//            myButtonLabel.setTitle("Register", for: .normal)
//        }
//
//    }
//
    
    func imageConfig(){
//        myDisplayImage.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
//        myDisplayImage.contentMode = .scaleAspectFit
//        myDisplayImage.clipsToBounds = true
//        myDisplayImage.image = UIImage.init(named: "login4.jpg")
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = " Success"
        content.subtitle = "Successfully Registered"
        content.body = "Thank you for the registration .You have successfully registered yourself. PLEASE LOG IN "
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1,
                                                        repeats: false)
        
        let requestIdentifier = "demoNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    

    
}

