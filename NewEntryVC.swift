//
//  NewEntryVC.swift
//  Mustachio
//
//  Created by Noah Kellem on 5/1/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class NewEntryVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK - Storyboard Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lengthTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var entryImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel!.text = UserData.shared.getDate()[3]

        // Do any additional setup after loading the view.
        
        //setting up a tap gesture recognizer for the image view so we can treat it like a button
        let entryGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(entryImageTapped))
        entryImage!.isUserInteractionEnabled = true
        entryImage!.addGestureRecognizer(entryGestureRecognizer)
        
        //sets up gesture recognizer to dismiss the keyboard when the user taps anywhere
        let screenTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(screenTap)
        
    }

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
    
    // MARK - Storyboard Actions
    @IBAction func saveEntry(_ sender: Any) {
        
        
        if lengthTextView.text == nil || descriptionTextView.text == nil || entryImage.image == nil{
            return
        }
        
        let newEntry = JournalEntry(description: descriptionTextView!.text, hairLength: Double(lengthTextView!.text)!, image: entryImage.image!)
        
        UserData.shared.totalJournalEntries.append(newEntry)
        print(UserData.shared.totalJournalEntries.count)
        print(UserData.shared.totalJournalEntries[0].journalDescription ?? "No Description")
        
        reset()
        
        UserData.shared.saveEntries()
    }
    
    
    
    
    
    // MARK - Helper Methods
    func reset(){
        lengthTextView!.text = ""
        descriptionTextView!.text = ""
    }
    
    //allows the user to open the camera and take pictures
    func entryImageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        //allows the user to open the camera view and take pictures
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        print("tapped")
        
    }
    //places the user captured image on the screen
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject: AnyObject]!) {
        entryImage.image = image
        self.dismiss(animated: true, completion: nil)
        print("executed")
    }
    
    //closes the keyboard
    func dismissKeyboard(){
        view.endEditing(true)
    }

}
