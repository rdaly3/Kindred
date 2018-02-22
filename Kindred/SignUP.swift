//
//  SignUP.swift
//  Kindred
//
//  Created by Administrator on 2/19/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class SignUP: UIViewController {

    let appDelegateTemp = UIApplication.shared.delegate as? AppDelegate
    
    
    @IBAction func logInPressed(_ sender: Any) {
        let fbLoginManager: FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                // if user cancels the login
                if (result?.isCancelled)!{
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email")){
                    self.getFBUserData()
                }
                
                self.appDelegateTemp?.window?.rootViewController = UIStoryboard(name: "MainList", bundle: Bundle.main).instantiateInitialViewController()
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if FBSDKAccessToken.current() != nil {
            //user is logged in, do work such as go to next view controller
        }
        
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    //everything works, print the user data
                    print(result)
                }
            })
        }
    }

 


}


