//
//  LoginModel.swift
//  KakeiboApp_LoginTest
//
//  Created by 山口誠士 on 2021/10/17.
//

import Foundation
import FirebaseAuth
import UIKit

protocol LoginOKDelegate {
    
    func loginOK(userID:String)
    
}

class LoginModel{
    

    let auth = Auth.auth()
    var loginOKDelegate:LoginOKDelegate?
    

    
    func login(emailTextField:UITextField,passwordTextField:UITextField,errorShowLabel:UILabel){
        
        if emailTextField.text == ""{
            
            errorShowLabel.text = "メールアドレスを入力してください"
            
        }else if passwordTextField.text == ""{
            
            errorShowLabel.text = "パスワードを入力してください"
            
        }else{
            auth.signIn(withEmail: emailTextField.text! , password: passwordTextField.text!) { result, error in
                
                if error != nil{
                    
                    self.showError(error, showLabel: errorShowLabel)

                    
                }else{
                    if let user = result?.user.email{
                        let userID = String(user)
                        print(userID)
                        self.loginOKDelegate?.loginOK(userID: userID)
                        emailTextField.text = ""
                        passwordTextField.text = ""
                        errorShowLabel.text = ""
                    }
                }
            }
            
            
        }
        
     
    }
    
    func showError(_ errorOrNil: Error?,showLabel:UILabel){
        
        guard let error = errorOrNil else { return }
        let message = errorMessage(of: error)
        
        showLabel.text = message
        
    }
    
    func errorMessage(of error:Error) -> String{
        var message = "エラーが発生しました"
        guard let errcd = AuthErrorCode(rawValue: (error as NSError).code) else {
            return message
        }
        
        switch errcd {
        case .networkError: message = "ネットワークに接続できません"
        case .userNotFound: message = "ユーザが見つかりません"
        case .invalidEmail: message = "不正なメールアドレスです"
        case .emailAlreadyInUse: message = "このメールアドレスは既に使われています"
        case .wrongPassword: message = "入力した認証情報でサインインできません"
        case .userDisabled: message = "このアカウントは無効です"
        case .weakPassword: message = "パスワードが脆弱すぎます"
        default: break
        }
        return message
        
        
    }
    
    
    
}
