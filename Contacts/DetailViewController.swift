//
//  DetailViewController.swift
//  Contacts
//
//  Created by Rachel Stevenson on 3/27/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    var contact: Contact?
    
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var phoneNumberField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.delegate = self
        self.phoneNumberField.delegate = self
        
        if let contact = self.contact {
            if let name = contact.name {
                self.nameField.text = name
            }

           if let phoneNumber = contact.phoneNumber {
                self.phoneNumberField.text = phoneNumber
            }
        }

        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
//        if textField == self.nameField {
//            self.contact?.name = textField.text
//        } else if textField == self.phoneNumberField {
//            self.contact?.phoneNumber == textField.text
//        }
        if textField == nameField {
            contact?.name = textField.text
        } else if textField == phoneNumberField {
            contact?.phoneNumber = textField.text
        }



    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
