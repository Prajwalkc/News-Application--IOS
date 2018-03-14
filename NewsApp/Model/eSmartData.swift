//
//  eSmartData.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/3/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
////
//"content_title": "Five must-see attractions in Dubai Garden Glow",
//"content_url": "five-must-see-attractions-in-dubai-garden-glow",
//"content_page_title": "Five must-see attractions in Dubai Garden Glow",
//"content_body": "<p style=\"text-align: justify;\">Packing lunches, making sure everyone is on time, ensuring everyone has their pants on, knowing where you&#39;re all headed, dealing with tears, breaking up fights - being a parent in your own house can be difficult. However, there is a way to make things easier, much easier. Take your family on an adventure in the park.</p>\r\n\r\n<p style=\"text-align: justify;\">Dubai Garden Glow can trigger those happy hormones, for starters, the bright lights and colors can increase energy levels and boost happiness. Maybe it&#39;s just the ambiance - who can resist smiling as you see the entire park light up? The park opens its door at 4 pm, it&#39;s the perfect way to get the little ones running around and build up to the light show that starts at sunset.</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>#1 Ice Park<br />\r\n#2 My Dubai<br />\r\n#3 Magical Nights<br />\r\n#4 Underwater Wonderland<br />\r\n#5 The Dinosaur Park</strong></p>\r\n",
//"featured_img": "http://esmart.almawadait.com/uploads/content/212ab20dbdf4191cbcdcf015511783f4aaa.jpg",
import Foundation
class eSmartData: NSObject {
    var content_title : String?
    var content_url : String?
    var content_page_title :String?
    var content_body : String?
    var featured_img : String?
    var content_title_ar : String?
  
     init(json : NSDictionary) {
        self.content_title = json["content_title"] as? String
        self.content_url = json["content_url"] as? String
        self.content_page_title = json["content_page_title"] as? String
        self.content_body = json["content_body"] as? String
        self.featured_img = json["featured_img"] as? String
        self.content_title_ar = json["content_title_ar"] as? String
    }
}
