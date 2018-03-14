//
//  userInfoRegisterViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/11/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit



class userInfoRegisterViewController: UIViewController   {
    @IBOutlet weak var myPasswordTextField: UITextField!
    @IBOutlet weak var myUserNameTextfield: UITextField!
    var userInfolist :[UserInfo] = []
    var sqlnew = SqlNew()
    let alert = Alert()
    @IBAction func myCancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var myContactnoTextField: UITextField!
  
    override func viewDidLoad() {
        
       
    
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


    
    @IBAction func myAddBtnPressed(_ sender: Any) {
        if myAgeTextField.text != "" && myNameTextField.text != "" && myContactnoTextField.text != "" && myAddressTextField.text != "" && myPasswordTextField.text != "" && myUserNameTextfield.text != "" {
            
            
       sqlnew.addDataUserInfo(userName: myUserNameTextfield.text!, Name: myNameTextField.text!, ContactNo: myContactnoTextField.text!, address: myAddressTextField.text!, age: myAgeTextField.text!, password: myPasswordTextField.text!)

            UserDefaults.standard.set(true, forKey: "isRegistered")
           self.dismiss(animated: true, completion: nil)
        }
        else
        {
            self.present(alert.alertNotify(title: "Error", message: "Please fill up the data to continue"), animated: true
                , completion: nil)
            
        }
    }
    @IBOutlet weak var myAddressTextField: UITextField!
    @IBOutlet weak var myAgeTextField: UITextField!
    @IBOutlet weak var myNameTextField: UITextField!
    
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
