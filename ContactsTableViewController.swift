//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Rachel Stevenson on 3/26/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
        //Data Variables
        var contacts = [Contact]()
    
        //Outlets
    
        //Actions
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let jenny = Contact(phoneNumber: "867-5309")
        let rich = Contact(name: "Rich", phoneNumber: "888-888-8888")
        let mindy = Contact(name: "Mindy")
        
        self.contacts.append(jenny)
        self.contacts.append(rich)
        self.contacts.append(mindy)

        let moveButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: Selector("toggleEdit"))
        self.navigationItem.leftBarButtonItem = moveButton
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func toggleEdit() {
        self.tableView.setEditing(!self.tableView.editing, animated: true)
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing {
            return .None
        } else {
            return .Delete
        }
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.contacts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let contact = self.contacts[indexPath.row]
        
        if let name = contact.name {
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "No name"
        }

        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = self.tableView.indexPathForCell(sender as UITableViewCell)!
        let contact = self.contacts[indexPath.row]
        var destination = segue.destinationViewController as DetailViewController
        destination.contact = contact
    }


    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.contacts.removeAtIndex(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
      /* else if editingStyle == .Insert {
     */                   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let contactMoving = self.contacts.removeAtIndex(fromIndexPath.row)
        self.contacts.insert(contactMoving, atIndex: toIndexPath.row)
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
