//
//  ViewController.swift
//  haveYou
//
//  Created by Canyon Boak on 3/17/16.
//  Copyright © 2016 Canyon Boak. All rights reserved.
//

import UIKit
import CoreData
import Material

class ViewController: UIViewController {
    
    // Mark: - IBOutlets & Global Variables
    
    @IBOutlet weak var taskDescLabel: UILabel!
    @IBOutlet weak var taskYesButton: UIButton!
    @IBOutlet weak var taskLaterButton: UIButton!
    @IBOutlet weak var addNewTaskView: MaterialPulseView!
    
    let dataHandler = HYDataHandler.sharedInstance
    var currentTask: Task?
    var context: NSManagedObjectContext?
    
    // Mark: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI Setup
        addNewTaskView.backgroundColor = UIColor.blackColor()
        
        // Fetch latest task from CoreData
        let appDel = (UIApplication.sharedApplication().delegate as! AppDelegate)
        context = appDel.managedObjectContext
        if let theTask = HYDataHandler.fetchCurrentTask(context!) {
            // Configure view accordingly with current task
            currentTask = theTask
            taskDescLabel.text = theTask.desc
        } else {
            // If there is no current task, orient user to task creation
            performSegueWithIdentifier("addTask", sender: self)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Mark: - View Functions
    
    internal func refreshWithNextTask() {
        if let theTask = HYDataHandler.fetchCurrentTask(context!) {
            // Configure view accordingly with current task
            currentTask = theTask
            taskDescLabel.text = theTask.desc
        }
    }
    
    // Mark: - IBActions

    @IBAction func clickedYesForTask(sender: AnyObject) {
        if let task = currentTask {
            HYDataHandler.completeTask(task, context: context!)
        }
        refreshWithNextTask()
    }
    
    @IBAction func clickedLaterForTask(sender: AnyObject) {
        if let task = currentTask {
            HYDataHandler.remindMeLater(task, context: context!)
        }
        refreshWithNextTask()
    }
    
    @IBAction func unwindAndCancel(segue: UIStoryboardSegue) {
        let presentingVC = segue.sourceViewController
        presentingVC.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func unwindAndAddTask(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! AddTaskViewController
        
        // Create new task
        let appDel = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context = appDel.managedObjectContext
        
        if let description = source.newTaskDescTextField.text {
            HYDataHandler.addNewTaskWithDescription(description, context: context, dueDate: NSDate())
        }
        
        // Update view
        refreshWithNextTask()
        
        // Dismiss AddVC
        let presentingVC = segue.sourceViewController
        presentingVC.dismissViewControllerAnimated(true, completion: nil)
    }
}

