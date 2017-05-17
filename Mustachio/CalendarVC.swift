//
//  CalendarVC.swift
//  Mustachio
//
//  Created by Noah Kellem on 5/15/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CalendarVC: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //want to reload the TableView everytime it appears again - usually after adding a new journal entry
    override func viewDidAppear(_ animated: Bool) {
        //reload the data here
        super.viewDidAppear(true)
        self.collectionView?.reloadData()
        //consider making it so that data is only reloaded if the count of journalEntries has changed
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if let indexPath = collectionView?.indexPath(for: sender as! CalendarCell){
            let selectedRow = indexPath.row
            guard selectedRow < UserData.shared.totalJournalEntries.count else{
                print("row \(selectedRow) is not in Journal!")
                return
            }
            let detailVC = segue.destination as! JournalEntryVC
            detailVC.entry = UserData.shared.totalJournalEntries[selectedRow]
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return UserData.shared.totalJournalEntries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
    
        // Configure the cell
        if UserData.shared.totalJournalEntries.count > 0{
            let entry = UserData.shared.totalJournalEntries[indexPath.row]
            cell.monthLabel.text = entry.month
            cell.dateLabel.text = entry.day
            //cell.frame.size.width = view.frame.size.width
            //cell.frame.size.height = cell.frame.size.width
            
            print(cell.frame.size.width)
            
        }
    
        return cell
    }
    
    //method that resizes cells in the collection/calendar view
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3, height: 125)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
