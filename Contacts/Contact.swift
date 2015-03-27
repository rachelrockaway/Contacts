//
//  Contact.swift
//  Contacts
//
//  Created by Rachel Stevenson on 3/26/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var name:String?
    var phoneNumber:String?
    
    init(name:String? = nil, phoneNumber:String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        super.init()
    }
   
}
