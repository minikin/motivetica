//
//  AppDelegate.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 9/21/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  lazy var coreDataStack = CoreDataStack(modelName: CoreDataHelper.motiveticaModel)
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    guard let rootViewController = window?.rootViewController as? TypingMotiveticaViewController else {
      fatalError("Application Storyboard mis-configuration")
    }
    rootViewController.coreDataStack = coreDataStack

    Fabric.with([Crashlytics.self])
    return true
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    coreDataStack.saveContext()
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    coreDataStack.saveContext()
  }
}
