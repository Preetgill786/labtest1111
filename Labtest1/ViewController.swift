//
//  ViewController.swift
//  Labtest1
//
//  Created by MacStudent on 2020-01-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var stData: [Data] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //to register table cell
         tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            fetchData()
            tableView.reloadData()
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
       
    }

extension ViewController:UITableViewDataSource
{
    //dasda kinia rows ne ik particular section ch
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.textLabel?.text = studentDetails[indexPath.row]
        
        let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .short
           dateFormatter.timeStyle = .none
        
        let value = stData[indexPath.row]
        cell.textLabel!.text = value.name! + ", " + String(value.fees) + ", " + String(value.age) + ", " + dateFormatter.string(from: value.date!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         
        if editingStyle == .delete{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let person = stData[indexPath.row]
            context.delete(person)

                do {
                        try context.save()
            
                    }
                    catch let error as NSError {
                        print(error)
                    }
            
            fetchData()
            tableView.reloadData()
        }
        
    }
    
}


