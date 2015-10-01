//
//  AppDelegate.swift
//  LocalyticsDemo
//
//  Created by Paul Sevilla on 2/10/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    // Localytics.autoIntegrate("876359c054407b0892f2071-1f900b46-b114-11e4-53db-00a426b17dd8", launchOptions: launchOptions)
    Localytics.integrate("876359c054407b0892f2071-1f900b46-b114-11e4-53db-00a426b17dd8")
    
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    Localytics.closeSession()
    Localytics.upload()
  }

  func applicationDidEnterBackground(application: UIApplication) {
    Localytics.closeSession()
    Localytics.upload()
  }

  func applicationWillEnterForeground(application: UIApplication) {
    Localytics.openSession()
    Localytics.upload()

  }

  func applicationDidBecomeActive(application: UIApplication) {
    Localytics.openSession()
    Localytics.upload()
  }

  func applicationWillTerminate(application: UIApplication) {
    Localytics.closeSession()
    Localytics.upload()
  }


}

