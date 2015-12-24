/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    The `AppDelegate` handles higher-level app events.
*/

import UIKit
import HomeKit

/// A standard app delegate.
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, HMHomeManagerDelegate {
    // MARK: Properties

    var window: UIWindow?
    var homeManager: HMHomeManager?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        self.homeManager = HMHomeManager()
        self.homeManager?.delegate = self

        return true
    }
    
    func applicationWillTerminate(application: UIApplication)
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func homeManagerDidUpdateHomes(manager: HMHomeManager)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("UpdateHomesNotification", object: self)
    }
    
    func homeManagerDidUpdatePrimaryHome(manager: HMHomeManager)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("UpdatePrimaryHomeNotification", object: self)
    }
    
}