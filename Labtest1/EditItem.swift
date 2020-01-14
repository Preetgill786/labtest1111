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
    
  
    
    @IBAction func editSave(_ sender: UIBarButtonItem) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
    }
    
   
}
