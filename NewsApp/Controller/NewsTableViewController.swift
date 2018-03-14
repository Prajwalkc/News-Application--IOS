//
//  NewsTableViewController.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/12/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class NewsTableViewController: UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        SJSwiftSideMenuController.hideLeftMenu()
        setNavButton()
        
    }
    var userNewsList : [userNews] = []
    var sqlnew = SqlNew()
    override func viewDidLoad() {
        self.navigationItem.title = "All News"
        super.viewDidLoad()
        userNewsList = sqlnew.listNewsInformation()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return userNewsList.count
    }
    func setNavButton(){
        let image = UIImage.init(named: "order.png")
        let button =  UIBarButtonItem.init(image: image, style: .done, target: self , action: #selector(handleSlide))
        navigationItem.setLeftBarButton(button, animated: false)
        
    }
    @objc func handleSlide(){
        SJSwiftSideMenuController.toggleLeftSideMenu()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.newsAuthor.text = userNewsList[indexPath.row].userName
        cell.newsDate.text = userNewsList[indexPath.row].news_date
        cell.newsTitle.text = userNewsList[indexPath.row].news_title

    
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let allnewsVC = self.storyboard?.instantiateViewController(withIdentifier: "allnewsVC") as! AllNewsViewController
        allnewsVC.index = indexPath.row
        allnewsVC.newsListRef = userNewsList
        self.navigationController?.pushViewController(allnewsVC, animated: true)
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
