//
//  ViewController.swift
//  Keychain_Example
//
//  Created by Furkan Ozoglu on 13.11.2017.
//  Copyright © 2017 Furkan Ozoglu. All rights reserved.
//

import UIKit
import Locksmith

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var keychainLabel: UILabel!

    var dictionary = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func saveTextButtonTapped(_ sender: UIButton) {
        
        do{
            //Save
            if dictionary["text"] as? String == nil {
                try Locksmith.saveData(data: ["text" : textfield.text!], forUserAccount: "AppName")
            }
            //Update
            else{
                try Locksmith.updateData(data: ["text" : textfield.text!], forUserAccount: "AppName")
            }
            
        }
        catch{
            print("Text could not be writed on keychain.")
        }
    }
    
    @IBAction func retriveTextButtonTapped(_ sender: UIButton) {
        //Retrive
        dictionary = Locksmith.loadDataForUserAccount(userAccount: "AppName")!
        keychainLabel.text = dictionary["text"] as? String
    }
    
}

