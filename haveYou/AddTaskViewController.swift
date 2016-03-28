//
//  AddTaskViewController.swift
//  haveYou
//
//  Created by Canyon Boak on 3/17/16.
//  Copyright © 2016 Canyon Boak. All rights reserved.
//

import UIKit
import Material

class AddTaskViewController: UIViewController, TextFieldDelegate {

    // Mark: - IBOutlets
    @IBOutlet weak var newTaskDescTextField: TextField!
    
    let dataHandler = HYDataHandler.sharedInstance
    
    // Mark: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newTaskDescTextField.keyboardAppearance = UIKeyboardAppearance.Dark
        newTaskDescTextField.becomeFirstResponder()
        
        newTaskDescTextField.delegate = self
        newTaskDescTextField.placeholder = "I also have to..."
        newTaskDescTextField.backgroundColor = UIColor.clearColor()
        newTaskDescTextField.placeholderTextColor = MaterialColor.grey.base
        newTaskDescTextField.font = RobotoFont.regularWithSize(20)
        newTaskDescTextField.textColor = MaterialColor.white
        newTaskDescTextField.borderStyle = .None
        
        newTaskDescTextField.titleLabel = UILabel()
        newTaskDescTextField.titleLabel!.font = RobotoFont.mediumWithSize(12)
        newTaskDescTextField.titleLabelColor = MaterialColor.white
        newTaskDescTextField.titleLabelActiveColor = MaterialColor.blue.accent3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    @IBAction func cancelAddTask(sender: AnyObject) {
        newTaskDescTextField.resignFirstResponder()
        
    }
    
    @IBAction func addTask(sender: AnyObject) {
        newTaskDescTextField.resignFirstResponder()
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
