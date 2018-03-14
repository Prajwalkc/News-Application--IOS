//
//  MainViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/6/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class MainViewController: UIViewController {
    var name : String?
    var password : String?
    var sqlnew = SqlNew()
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        imageConfig()
        SJSwiftSideMenuController.hideLeftMenu()
        setNavButton()
     
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "About The News App"
        myTitlePage.text = "News Application. \n A News Portal for the reader from anywhere"
        myTitlePage.sizeToFit()
        myDescription.text = "Today everybody wants to get updated with the latest happenings around the world. But in today’s fast life nobody has time to sit in front of television all day and watch breaking news. Nowadays web media has become a great medium of educating and informing people.  Sixty six percent people are using internet on their smart phones. They can easily access online News portals whenever and wherever they want to know that what is going on around the whole world. People can get news of any region just by putting an appropriate keyword in the search engine.\n Online communication has been rapidly preferred medium for the people to exchange news, talks, chats over the globe. Regardless of the news they cover, they face challenges for displaying huge content from different corners of the world for different topics, it involves the interest of huge number of people."
        myDescription.sizeToFit()
        
    }
    
   

    @IBOutlet weak var myLeftBarButton: UIBarButtonItem!
    @IBAction func myDropDownBtn(_ sender: Any) {
    }


    @IBOutlet weak var myBackImage: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setNavButton(){
        let image = UIImage.init(named: "order.png")
        let button =  UIBarButtonItem.init(image: image, style: .done, target: self , action: #selector(handleSlide))
        navigationItem.setLeftBarButton(button, animated: false)
   
    }
    @objc func handleSlide(){
     SJSwiftSideMenuController.toggleLeftSideMenu()
    }
    func imageConfig(){
        myBackImage.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        
        myBackImage.clipsToBounds = true
       myBackImage.image = UIImage.init(named: "login1.jpg")
        
    }

    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myTitlePage: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
