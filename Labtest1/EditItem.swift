//
//  EditItem.swift
//  Labtest1
//
//  Created by MacStudent on 2020-01-14.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class EditItem: UIViewController {

   var stData: [Data] = []
    @IBOutlet weak var nameToEdit: UITextField!
    @IBOutlet weak var editAge: UITextField!
    @IBOutlet weak var editFees: UITextField!
    @IBOutlet weak var editDate: UITextField!
    
  var index = 0
    var sName = ""
    var sAge = 0
    var sFees = 0.0
    var sDate = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
       let dateFormatter = DateFormatter()
              dateFormatter.dateStyle = .short
              dateFormatter.timeStyle = .none
        //getting values from text fields
        nameToEdit.text = sName
        editAge.text = String(sAge)
        editFees.text = String(sFees)
        editDate.text = dateFormatter.string(from: sDate)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
    }
    @IBAction func editSave(_ sender: UIBarButtonItem) {
        let dateFormatter = DateFormatter()
               dateFormatter.dateStyle = .short
               dateFormatter.timeStyle = .none
        print(stData[index])
      
        updateFunc(student: stData[index], name: nameToEdit.text!,age : Int32(editAge.text!)!, fees : Double(editFees.text!)!, date : dateFormatter.date(from: editDate.text!)!)
        
        self.navigationController?.popToRootViewController(animated: true)//go back to main page after pressing save btn
        
    }
    
   
    
    func fetchData(){
          
             let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

           do{
               stData = try context.fetch(Data.fetchRequest())
           }
               //if error exists/catch it
           catch{
               print(error)
           }
       }
    func updateFunc(student : Data, name:String, age:Int32, fees:Double, date:Date){
            student.name = name
            student.age = age
            student.fees = fees
            student.date = date
            saveContext()
       }
    
    func saveContext () {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                   
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
        
    }




    
    
    
    

