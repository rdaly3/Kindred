//
//  ViewController.swift
//  Kindred
//
//  Created by Administrator on 2/13/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import GradientLoadingBar
import SVProgressHUD

class ViewController: UIViewController {
    

    let gradientLoadingBar = GradientLoadingBar()
    

    
  
    @IBAction func loginFacebookAction(_ sender: UIButton) {
        // Show loading bar
        self.gradientLoadingBar.show()
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
            
                    self.getFBUserData()
                }
                
                
            }
    
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Extend the code sample from 6a. Add Facebook Login to Your Code
        // Add to your viewDidLoad method:
        // sloginButton.readPermissions = [usernam]

        
        if FBSDKAccessToken.current() != nil {
            // Show loading bar
            self.gradientLoadingBar.show()
            print("already logged in :)")
            // Hide loading bar
            self.gradientLoadingBar.hide()
            self.performSegue(withIdentifier: "gotoActivities", sender: self)
        }
    }

    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    // Hide loading bar
                    self.gradientLoadingBar.hide()
                    SVProgressHUD.dismiss()
                    
                    //everything works print the user data
                    print(result)
                    
                    
                }
            })
            
          self.performSegue(withIdentifier: "gotoActivities", sender: self)
        }
    }


}




