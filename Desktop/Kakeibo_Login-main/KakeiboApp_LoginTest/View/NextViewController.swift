//
//  NextViewController.swift
//  KakeiboApp_LoginTest
//
//  Created by 山口誠士 on 2021/10/17.
//

import UIKit
import FirebaseAuth

class NextViewController: UIViewController {
    
    var userID = String()
    let auth = Auth.auth()
    var loginModel:LoginModel?
    
    @IBOutlet weak var showUserID: UILabel!
    @IBOutlet weak var errorShow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userID)
        
        self.navigationController?.isNavigationBarHidden = true
        
        if userID != ""{
            
            showUserID.text = userID
            
            
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: Any) {
        
        do {
            try auth.signOut()
            
            navigationController?.popViewController(animated: true)
            
        } catch let error {
            
            loginModel?.showError(error, showLabel: errorShow)
            
        }
        
        
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
