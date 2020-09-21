//
//  AppDelegate.swift
//  PushNotification
//
//  Created by Pavel Moroz on 20.09.2020.
//  Copyright © 2020 Pavel Moroz. All rights reserved.
//

import UIKit
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {


        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false, kOSSettingsKeyInAppLaunchURL: false]

        OneSignal.initWithLaunchOptions(launchOptions, appId: "71354680-7a57-404d-8ae3-3c4200b5842c", handleNotificationAction: { (result) in

                    let payload = result?.notification.payload
                    if let additionalData = payload?.additionalData {

                        let destination = additionalData["destination"] as? String ?? ""
                       // print("the destination is: \(destination)")
                        print(additionalData)
                        
                        UserDefaults.standard.set(destination, forKey: "testKey")
                        //
                        
                    }


                },settings: onesignalInitSettings)

        return true
    }

    private func application(application: UIApplication,  didReceiveRemoteNotification userInfo: [NSObject : AnyObject],  fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {

            print("Recived: \(userInfo)")

//            switch application.applicationState {
//            case .active:
//    //            print("Application is open, do not override")
//                break
//            case .inactive, .background:
//
//                let payload: NSDictionary = userInfo as NSDictionary
//
//                if let variable = payload["variable"] as? String {
//                   // UserDataStatistics.openedPushId = variable
//                    print("variable")
//                }
//
//            default:
//                print("unrecognized application state")
//            }

    //        completionHandler(.newData)

        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

