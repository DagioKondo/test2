//
//  LoginViewController.swift
//  KakeiboApp_LoginTest
//
//  Created by 山口誠士 on 2021/10/17.
//

import UIKit

class LoginViewController: UIViewController ,LoginOKDelegate{

    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwrodTextField: UITextField!
    @IBOutlet weak var errorShow: UILabel!
    
    var loginModel = LoginModel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginModel.loginOKDelegate = self
        self.navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        loginModel.login(emailTextField: emailTextField, passwordTextField: passwrodTextField, errorShowLabel: errorShow)
        
    }
    
    func loginOK(userID: String) {
        
        if userID != nil{
            let nextVC = (storyboard?.instantiateViewController(identifier: "Next"))! as NextViewController
            nextVC.userID = userID
            navigationController?.pushViewController(nextVC, animated: true)
            
            
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
