//
//  LoginViewController.swift
//  VKApp
//
//  Created by Ольга Бычок on 28/01/2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import UIKit
import VK_ios_sdk

class LoginViewController: UIViewController {
    
    @IBAction func loginButton(_ sender: UIButton) {
        VKSdk.authorize(["email", "wall", "friends", "offline"])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let instance = VKSdk.initialize(withAppId: "7298901")
        instance?.register(self)
        instance?.uiDelegate = self
    }
    
}

extension LoginViewController: VKSdkDelegate, VKSdkUIDelegate {
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if result.state == .error {
            //alert
        } else {
            UserDefaults.standard.set(result.token.accessToken, forKey: "token")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let tabBarController = storyboard.instantiateViewController(withIdentifier: "123") as? TabBarController {
                
                tabBarController.navigationItem.hidesBackButton = true
                self.navigationController?.pushViewController(tabBarController, animated: true)
            }
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        // alert
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        if (self.presentedViewController != nil) {
            self.dismiss(animated: true, completion: {
                self.present(controller, animated: true, completion: {
                })
            })
        } else {
            self.present(controller, animated: true, completion: {
            })
        }
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        //alert
    }
    
    
}

