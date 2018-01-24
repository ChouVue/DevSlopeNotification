//
//  ViewController.swift
//  DevSlopeNotification
//
//  Created by Chou Vue on 1/24/18.
//  Copyright © 2018 VUE. All rights reserved.
//

/* For Notification you must get permission from the user first*/

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.)First thing you need to do is REQUEST PERMISSION
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {
            (granted, error) in
            
            //If they give us permission
            if granted {
                //Print Message
                print("Notification Access Granted")
            }
            //And if it wasnt granted
            else {
                //Print the error message
                print(error?.localizedDescription)
            }
        })
    }
    
    @IBAction func notifyBtnPressed(sender: UIButton) {
        
        scheduleNotification(inSeconds: 5, completion: { success in
            
            if success {
                print("Successfully Scheduled Notification")
            }
            else {
                print("Error Scheduling Notification")
            }
        })
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        
        let notif = UNMutableNotificationContent()
        notif.title = "New Notification"
        notif.subtitle = "These are working!"
        notif.body = "First time developing Notification!"
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            
            if error != nil{
                print(error)
                completion(false)
            }
            else {
                completion(true)
            }
        })
    }
}
























