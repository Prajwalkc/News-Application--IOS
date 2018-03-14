//
//  eSmartNewsViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/4/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import Kingfisher
class eSmartNewsViewController: UIViewController {
    var records : [eSmartData] = []
    var newsIndex : Int = Int()
    @IBOutlet weak var myBodyLabel: UILabel!
    @IBOutlet weak var myPageTitle: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myDisplayImahe: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myPageTitle.text = records[newsIndex].content_page_title!
        
        configImage()
        configBody()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configBody(){
        myBodyLabel.text = records[newsIndex].content_body!.html2String
       myBodyLabel.preferredMaxLayoutWidth = 700
        myBodyLabel.sizeToFit()
    }
    func configImage(){
        let url = URL.init(string: self.records[newsIndex].featured_img!)
        myDisplayImahe.kf.setImage(with: url)
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
    extension Data {
        var html2AttributedString: NSAttributedString? {
            do {
                return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            } catch {
                print("error:", error)
                return  nil
            }
        }
        var html2String: String {
            return html2AttributedString?.string ?? ""
        }
    }
    
    extension String {
        var html2AttributedString: NSAttributedString? {
            return Data(utf8).html2AttributedString
        }
        var html2String: String {
            return html2AttributedString?.string ?? ""
        }
    }


