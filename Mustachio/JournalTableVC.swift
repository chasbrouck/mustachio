//
//  JournalTableVC.swift
//  Mustachio
//
//  Created by Noah Kellem on 4/30/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

//notification that lets lets JournalTableVC know when a new entry was added
let myEntryAddedNotification = NSNotification.Name("myEntryAddedNotification")

class JournalTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //deleting and loading journalEntries
        print("Deleting and loading Journal Entries")
        UserData.shared.totalJournalEntries.removeAll()
        print("Favorites=\(UserData.shared.totalJournalEntries)")
        
        //reload all the favorites from disk
        let pathToFile = FileManager.filePathInDocumentsDirectory(fileName: "allEntries.archive")
        //make sure the file exists before loading it
        if FileManager.default.fileExists(atPath: pathToFile.path){
            UserData.shared.totalJournalEntries = NSKeyedUnarchiver.unarchiveObject(withFile: pathToFile.path) as! [JournalEntry]
            print("Journal Entries=\(UserData.shared.totalJournalEntries)")
        }else{
            print("could not find allEntries.archive")
        }
        
        //get the notification center
        let nc = NotificationCenter.default
        
        //register this object as an observer
        nc.addObserver(self, selector: #selector(showEntries), name: myEntryAddedNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserData.shared.totalJournalEntries.count //returns rows to be the number of entries in journalEntries
    }
    
    //want to reload the TableView everytime it appears again - usually after adding a new journal entry
    override func viewDidAppear(_ animated: Bool) {
        //reload the data here
        super.viewDidAppear(true)
        self.tableView.reloadData()
        //consider making it so that data is only reloaded if the count of journalEntries has changed
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalCell", for: indexPath) as! JournalCell

        // Configure the cell...
        if UserData.shared.totalJournalEntries.count > 0{
            let entry = UserData.shared.totalJournalEntries[indexPath.row]
            cell.thumbnail.image = entry.journalImage
            cell.descriptionLabel.text = entry.journalDescription
            cell.monthLabel.text = entry.month
            cell.dayLabel.text = entry.day
        }

        return cell
    }
    
    //set height of cells
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
 

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            UserData.shared.totalJournalEntries.remove(at: indexPath.row)
            
            //Update the tableView
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            UserData.shared.saveEntries()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            guard selectedRow < UserData.shared.totalJournalEntries.count else{
                print("row \(selectedRow) is not in Journal!")
                return
            }
            let detailVC = segue.destination as! JournalEntryVC
            detailVC.entry = UserData.shared.totalJournalEntries[selectedRow]
        }
    }
    
    // MARK: - Notifications
    func showEntries(notification: NSNotification){
        //change to Journal Entries tab
        tabBarController?.selectedIndex = 0
    }
    

}
