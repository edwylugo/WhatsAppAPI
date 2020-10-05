//
//  WhatsApp.swift
//  WhatsAppAPI
//
//  Created by Edwy Lugo on 05/10/20.
//  Copyright © 2020 Edwy Lugo. All rights reserved.
//

import Foundation
import UIKit
import SafariServices


public class WhatsApp {
    public init() {}
    
    public func log(message: String) {
        print("Log message: ", message)
    }
    
    public func sendMessageWhats(message: String, vc: UIViewController) {
        let urlWhats = "whatsapp://send?text=\("\(message)")"
        if message.description != "" {
                if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                      if let whatsappURL = NSURL(string: urlString) {
                            if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                                 UIApplication.shared.open(whatsappURL as URL)
                             }
                             else {
                                self.alertInstall(vc: vc)
                             }
                      }
                }
        } else {
            return
        }
    }
    
    public func sendMessageNumberSpecific(message: String, vc: UIViewController) {
        let phoneNumber =  "\(message)"
        if phoneNumber.description != "" {
            let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(phoneNumber)")!
            if UIApplication.shared.canOpenURL(appURL) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
                }
                else {
                    UIApplication.shared.openURL(appURL)
                }
            } else {
                self.alertInstall(vc: vc)
            }
        } else {
            return
        }
    }
    
    func alertInstall(vc: UIViewController) {
        let alertController = UIAlertController(title: "Message", message: "We verify that you do not have the Whatsapp application installed. Do you want to install?", preferredStyle: .alert)
                
        let actionOk = UIAlertAction(title: "Install", style: .default) { (action:UIAlertAction) in
            self.installWhatsApp(vc: vc)
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            alertController.dismiss(animated: true, completion: nil)
        }

        alertController.addAction(actionOk)
        alertController.addAction(actionCancel)
        vc.present(alertController, animated: true, completion: nil)

    }
    
    func installWhatsApp(vc: UIViewController) {
        if let url = URL(string: "https://apps.apple.com/br/app/whatsapp-messenger/id310633997") {
            let vcSafari = SFSafariViewController(url: url)
            vc.present(vcSafari, animated: true)
        }
    }
}


