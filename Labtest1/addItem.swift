//
//  addItem.swift
//  Labtest1
//
//  Created by MacStudent on 2020-01-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class addItem: UIViewController {

    //text fields de outlets
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var fees: UITextField!
    @IBOutlet weak var date: UITextField!
    
    
    
     // context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
      var student:[NSManagedObjectContext] = []
       var managedContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveFunc(_ sender: UIBarButtonItem) {
                     let stNane = name.text
                     let stAge = age.text
                     let stFees = fees.text
                     let stDate = date.text
                     
                     let dateFormatter = DateFormatter()
                     dateFormatter.dateStyle = .short
                     dateFormatter.timeStyle = .none
              
              self.save(name: stNane!,age : Int32(stAge!)!, fees : Double(stFees!)!, date : dateFormatter.date(from: stDate!)!)
              
              if let navController = self.navigationController {
                  navController.popViewController(animated: true)
              }
    }
    func save(name: String, age : Int32, fees : Double, date : Date)
     {
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           return
         }
     
     let managedContext = appDelegate.persistentContainer.viewContext
     
         let entity = NSEntityDescription.entity(forEntityName: "Data", in: managedContext)!
     let data = NSManagedObject(entity: entity,insertInto: managedContext)

         
     data.setValue(age, forKey: "age")
     data.setValue(date, forKey: "date")
     data.setValue(name, forKey: "name")
     data.setValue(fees, forKey: "fees")
         
         
         do {
                 try managedContext.save()
     
             }
             catch let error as NSError {
                 print(error)
             }
     }
    
}
