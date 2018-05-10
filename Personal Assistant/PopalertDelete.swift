//
//  PopalertDelete.swift
//  Personal Assistant
//
//  Created by Hector Kesar on 5/10/18.
//  Copyright © 2018 Final-Project. All rights reserved.
//

import UIKit
import Firebase
class PopalertDelete: UIViewController {

    @IBOutlet weak var filenamelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        filenamelabel.text = Make_a_list.nameoflist
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Deletebutton(_ sender: Any) {
        if filenamelabel.text != "No File Selected"{
            let userID = Auth.auth().currentUser?.uid
            let ref: DatabaseReference! = Database.database().reference().child("users").child(userID!).child("list").child(filenamelabel.text!)
            print(filenamelabel.text)
            ref.removeValue()
            let storage = Storage.storage()
            let storageRef = storage.reference().child("text-files").child(userID!).child(filenamelabel.text! + ".txt")
            storageRef.delete { error in
                if let error = error {
                    // Uh-oh, an error occurred!
                    print(error)
                } else {
                    // File deleted successfully
                }
            }
            self.view.removeFromSuperview()
        }
    }
    
    @IBAction func Cancelbutton(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
