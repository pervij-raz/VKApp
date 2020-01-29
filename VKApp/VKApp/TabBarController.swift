//
//  TabBarController.swift
//  VKApp
//
//  Created by Ольга Бычок on 29/01/2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import UIKit
import VK_ios_sdk

class TabBarController: UITabBarController {
    
    var isLogggedIn = false
    
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        VKSdk.forceLogout()
        isLogggedIn = false
        authorization()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = VKSdk.initialize(withAppId: "7298901")
        VKSdk.wakeUpSession(["email", "wall", "friends", "offline"]) {[weak self] (state, error) in
            self?.isLogggedIn = state == .authorized
            if !(self?.isLogggedIn ?? false) {
                self?.authorization()
            }
        }
    }
    
    private func authorization() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: "loginVC") as? LoginViewController {
            appDelegate.window?.rootViewController?.present(loginVC, animated: true, completion: nil)
        }
    }
    
    
}
