//
//  AddTaskViewController.swift
//  TodoList
//
//  Created by mac on 2022-03-16.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    
    var persistentContainer: NSPersistentContainer!
    

    @IBOutlet weak var list: UITextField!
    
    @IBAction func addTask(_ sender: Any) {
    
        
        let moc = persistentContainer.viewContext
        
        moc.perform {
            let taask = TaskList(context: moc)
            taask.tasks = self.list.text
            do {
                try moc.save()
            } catch {
                moc.rollback()
            }
        }
        
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
