//
//  Alert.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/4/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class Alert: NSObject {
    
    
    func alertNotify(title : String , message  : String) -> UIAlertController
    {
        let alertAction = UIAlertAction.init(title: "ok", style: .default) { (action) in
            
        }
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
    alert.addAction(alertAction)
        
        return alert
    }
    
}
