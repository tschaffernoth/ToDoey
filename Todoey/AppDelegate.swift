//
//  AppDelegate.swift
//  Todoey
//
//  Created by Thomas G Schaffernoth on 11/7/18.
//  Copyright © 2018 Thomas G Schaffernoth. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {


        // Override point for customization after application launch.
//        print(Realm.Configuration.defaultConfiguration.fileURL)

        do {
            _ = try Realm()
        } catch {
            print("Error initializing the new RealmDB \(error)")
        }

        return true
    }

    
}
