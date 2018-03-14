//
//  MenuTableViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/6/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController
class MenuTableViewController: UITableViewController {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    var menu : [String] = ["About the APP","eSmart News","My Profile","All News","Log Out"]
    override func viewDidLoad() {
       
        super.viewDidLoad()
        headerConfig()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @available(iOS 2.0, *)
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        switch indexPath.row {
        case 0:
            let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! MainViewController
            SJSwiftSideMenuController.pushViewController(mainVC, animated: true)
            break
        case 1 :
            print("I am at row 1")
            let DashTVC = self.storyboard?.instantiateViewController(withIdentifier: "DashTVC") as! DashBoardTableViewController
           SJSwiftSideMenuController.pushViewController(DashTVC, animated: true)
            break
        case 2 :
            print("i am at row 2")
            let userVC = self.storyboard?.instantiateViewController(withIdentifier: "userVC") as! UserViewController
             SJSwiftSideMenuController.pushViewController(userVC, animated: true)
           break
        case 3 :
            print("i am at row 3")
            let newsTVC = self.storyboard?.instantiateViewController(withIdentifier: "newsTVC") as! NewsTableViewController
            SJSwiftSideMenuController.pushViewController(newsTVC, animated: true)
            break
        case 4 :
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! ViewController
         UserDefaults.standard.set(false, forKey: "isLoggedIn")
            print("Sett")
            SJSwiftSideMenuController.pushViewController(loginVC, animated: true)
            break
        default:
            break
        }
        
    }
    func headerConfig(){
        myImage.image = UIImage.init(named: "news.png")
        myImage.frame.size = CGSize.init(width: 10, height: 20)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

 
    @IBOutlet weak var myTableHeadView: UIView!
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
            cell.myLabel.text = menu[indexPath.row]
          
        cell.selectionStyle = .none
     

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
