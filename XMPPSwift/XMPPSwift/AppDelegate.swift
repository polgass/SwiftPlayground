//
//  AppDelegate.swift
//  XMPPSwift
//
//  Created by Paul Sevilla on 2/24/15.
//  Copyright (c) 2015 Paul Sevilla. All rights reserved.
//

import UIKit

let kXMPPmyJID = "kXMPPmyJID";
let kXMPPmyPassword = "kXMPPmyPassword";

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  // XMPP Properties
  var xmppStream: XMPPStream?
  var xmppReconnect: XMPPReconnect?
  var xmppRoster: XMPPRoster?
  var xmppRosterStorage: XMPPRosterCoreDataStorage?
  var xmppvCardStorage: XMPPvCardCoreDataStorage?
  var xmppvCardTempModule: XMPPvCardTempModule?
  var xmppvCardAvatarModule: XMPPvCardAvatarModule?
  var xmppCapabilities: XMPPCapabilities?
  var xmppCapabilitiesStorage: XMPPCapabilitiesCoreDataStorage?
  var xmppRoom: XMPPRoom?
  var xmppMUC: XMPPMUC?
  var password: NSString?
  var customCertEvaluation = false
  var xmppConnected = false

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    setupStream()
    
//    if connect() {
//      println("Connected MOFO!")
//    }
    
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    // XMPP
    if application.respondsToSelector(Selector("setKeepAliveTimeout:handler:")) {
      application.setKeepAliveTimeout(600, handler: { () -> Void in
        println("KeepAliveHandler")
        // Do other keep alive stuff here.
      })
    }
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    // XMPP
    teardownStream()
  }

  // MARK :- XMPPFramework
  // Core Data
  func managedObjectContext_roster() -> NSManagedObjectContext {
    return xmppRosterStorage!.mainThreadManagedObjectContext
  }
  
  func managedObjectContext_capabilities() -> NSManagedObjectContext {
    return xmppCapabilitiesStorage!.mainThreadManagedObjectContext
  }
  
  // Private Methods
  func setupStream() {
    assert(xmppStream == nil, "Method setupStream invoked multiple times")
    
    // Setup xmpp stream
    //
    // The XMPPStream is the base class for all activity.
    // Everything else plugs into the xmppStream, such as modules/extensions and delegates.
    
    xmppStream = XMPPStream()
    
    #if !TARGET_IPHONE_SIMULATOR
      // Want xmpp to run in the background?
      //
      // P.S. - The simulator doesn't support backgrounding yet.
      //        When you try to set the associated property on the simulator, it simply fails.
      //        And when you background an app on the simulator,
      //        it just queues network traffic til the app is foregrounded again.
      //        We are patiently waiting for a fix from Apple.
      //        If you do enableBackgroundingOnSocket on the simulator,
      //        you will simply see an error message from the xmpp stack when it fails to set the property.
      xmppStream?.enableBackgroundingOnSocket = true
    #endif
    
    // Setup reconnect
    //
    // The XMPPReconnect module monitors for "accidental disconnections" and
    // automatically reconnects the stream for you.
    // There's a bunch more information in the XMPPReconnect header file.
    
    xmppReconnect = XMPPReconnect()
    
    // Setup roster
    //
    // The XMPPRoster handles the xmpp protocol stuff related to the roster.
    // The storage for the roster is abstracted.
    // So you can use any storage mechanism you want.
    // You can store it all in memory, or use core data and store it on disk, or use core data with an in-memory store,
    // or setup your own using raw SQLite, or create your own storage mechanism.
    // You can do it however you like! It's your application.
    // But you do need to provide the roster with some storage facility.
    
    xmppRosterStorage = XMPPRosterCoreDataStorage()
    //xmppRosterStorage = XMPPRosterCoreDataStorage(inMemoryStore: ())
    
    xmppRoster = XMPPRoster(rosterStorage: xmppRosterStorage)
    
    xmppRoster?.autoFetchRoster = true
    xmppRoster?.autoAcceptKnownPresenceSubscriptionRequests = true
    
    // Setup vCard support
    //
    // The vCard Avatar module works in conjuction with the standard vCard Temp module to download user avatars.
    // The XMPPRoster will automatically integrate with XMPPvCardAvatarModule to cache roster photos in the roster.
    
    xmppvCardStorage = XMPPvCardCoreDataStorage.sharedInstance()
    xmppvCardTempModule = XMPPvCardTempModule(withvCardStorage: xmppvCardStorage)
    
    xmppvCardAvatarModule = XMPPvCardAvatarModule(withvCardTempModule: xmppvCardTempModule)
    
    // Setup capabilities
    //
    // The XMPPCapabilities module handles all the complex hashing of the caps protocol (XEP-0115).
    // Basically, when other clients broadcast their presence on the network
    // they include information about what capabilities their client supports (audio, video, file transfer, etc).
    // But as you can imagine, this list starts to get pretty big.
    // This is where the hashing stuff comes into play.
    // Most people running the same version of the same client are going to have the same list of capabilities.
    // So the protocol defines a standardized way to hash the list of capabilities.
    // Clients then broadcast the tiny hash instead of the big list.
    // The XMPPCapabilities protocol automatically handles figuring out what these hashes mean,
    // and also persistently storing the hashes so lookups aren't needed in the future.
    //
    // Similarly to the roster, the storage of the module is abstracted.
    // You are strongly encouraged to persist caps information across sessions.
    //
    // The XMPPCapabilitiesCoreDataStorage is an ideal solution.
    // It can also be shared amongst multiple streams to further reduce hash lookups.s
    
    xmppCapabilitiesStorage = XMPPCapabilitiesCoreDataStorage.sharedInstance()
    xmppCapabilities = XMPPCapabilities(capabilitiesStorage: xmppCapabilitiesStorage)
    
    xmppCapabilities?.autoFetchHashedCapabilities = true
    xmppCapabilities?.autoFetchNonHashedCapabilities = true
    
    // MUC
    xmppMUC = XMPPMUC()
    
    // Activate xmpp modules
    xmppReconnect?.activate(xmppStream)
    xmppRoster?.activate(xmppStream)
    xmppvCardTempModule?.activate(xmppStream)
    xmppvCardAvatarModule?.activate(xmppStream)
    xmppCapabilities?.activate(xmppStream)
    xmppMUC?.activate(xmppStream)
    
    // Add ourself as a delegate to anything we may be interested in
    xmppStream?.addDelegate(self, delegateQueue: dispatch_get_main_queue())
    xmppRoster?.addDelegate(self, delegateQueue: dispatch_get_main_queue())
    xmppMUC?.addDelegate(self, delegateQueue: dispatch_get_main_queue())
    
    // Optional:
    //
    // Replace me with the proper domain and port.
    // The example below is setup for a typical google talk account.
    //
    // If you don't supply a hostName, then it will be automatically resolved using the JID (below).
    // For example, if you supply a JID like 'user@quack.com/rsrc'
    // then the xmpp framework will follow the xmpp specification, and do a SRV lookup for quack.com.
    //
    // If you don't specify a hostPort, then the default (5222) will be used.
    
    //	[xmppStream setHostName:@"talk.google.com"];
    //	[xmppStream setHostPort:5222];
    
    customCertEvaluation = true
  }
  
  func teardownStream() {
    xmppStream?.removeDelegate(self)
    xmppRoster?.removeDelegate(self)
    xmppMUC?.removeDelegate(self)
   
    xmppReconnect?.deactivate()
    xmppRoster?.deactivate()
    xmppvCardTempModule?.deactivate()
    xmppvCardAvatarModule?.deactivate()
    xmppCapabilities?.deactivate()
    xmppMUC?.deactivate()
    
    xmppStream?.disconnect()
  }
  
  
  // It's easy to create XML elments to send and to read received XML elements.
  // You have the entire NSXMLElement and NSXMLNode API's.
  //
  // In addition to this, the NSXMLElement+XMPP category provides some very handy methods for working with XMPP.
  //
  // On the iPhone, Apple chose not to include the full NSXML suite.
  // No problem - we use the KissXML library as a drop in replacement.
  //
  // For more information on working with XML elements, see the Wiki article:
  // https://github.com/robbiehanson/XMPPFramework/wiki/WorkingWithElements
  
  func goOnline() {
    var presence = XMPPPresence() // type="available" is implicit
    let domain: NSString = xmppStream!.myJID.domain
    
    if domain.isEqualToString("gmail.com") ||
      domain.isEqualToString("gtalk.com") ||
      domain.isEqualToString("talk.google.com") {
        let priority = DDXMLElement(name: "priority", stringValue: "24")
        presence.addChild(priority)
    }
    
    xmppStream!.sendElement(presence)
  }
  
  func goOffline() {
    let presence = XMPPPresence(type: "unavailable")
    xmppStream!.sendElement(presence)
  }
  
  // connect/disconnect
  func connect() -> Bool {
    if !xmppStream!.isDisconnected() {
      return true
    }
    
    var myJID = NSUserDefaults.standardUserDefaults().stringForKey(kXMPPmyJID)
    var myPassword = NSUserDefaults.standardUserDefaults().stringForKey(kXMPPmyPassword)
    
    //
    // If you don't want to use the Settings view to set the JID,
    // uncomment the section below to hard code a JID and password.
    //
    // myJID = "ppps@ejabberd.onvolo.com"
    // myPassword = "chatroom"
    
    if myJID == nil || myPassword == nil {
      return false
    }
    
    xmppStream!.myJID = XMPPJID.jidWithString(myJID)
    password = myPassword
    
    var error: NSError?
    if !xmppStream!.connectWithTimeout(XMPPStreamTimeoutNone, error: &error) {
      println("Error: \(error?.localizedDescription)")
      return false
    }
    return true
  }
  
  func disconnect() {
    goOffline()
    xmppStream!.disconnect()
  }
  
  // XMPPStream Delegate
  func xmppStream(sender: XMPPStream, socketDidConnect: GCDAsyncSocket) {
    println("socketDidConnect")
  }
  
  func xmppStream(sender: XMPPStream, willSecureWithSettings: NSMutableDictionary) {
    let expectedCertName = xmppStream!.myJID.domain
    if expectedCertName != nil {
      willSecureWithSettings.setObject(expectedCertName, forKey: (kCFStreamSSLPeerName as String))
    }
    if customCertEvaluation {
      willSecureWithSettings.setObject(NSNumber(bool: true), forKey: "GCDAsyncSocketManuallyEvaluateTrust")
    }
    println("willSecureWithSettings")
  }
  
  func xmppStream(sender: XMPPStream, didReceiveTrust: SecTrustRef, completionHandler: ((Bool) -> Void)) {
    println("didReceiveTrust")
    let bgQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    dispatch_async(bgQueue, { () -> Void in
      var result = SecTrustResultType(kSecTrustResultDeny)
      let status = SecTrustEvaluate(didReceiveTrust, &result)
      
      if status == noErr && (result == SecTrustResultType(kSecTrustResultProceed) || result == SecTrustResultType(kSecTrustResultUnspecified)) {
        completionHandler(true)
      } else {
        completionHandler(false)
      }
    })
  }
  
  func xmppStreamDidSecure(sender: XMPPStream) {
    println("xmppStreamDidSecure")
  }
  
  func xmppStreamDidConnect(sender: XMPPStream) {
    println("xmppStreamDidConnect")
    
    xmppConnected = true
    
    var error: NSError?
    if xmppStream!.authenticateWithPassword(password, error: &error) {
      println("authentification successful")
    }
  }
  
  func xmppStreamDidAuthenticate(sender: XMPPStream) {
    println("didAuthenticate")
    goOnline()
  }
  
  func xmppStreamDidNotAuthenticate(error: DDXMLElement) {
    println("didNOTAuthenticate")
  }
  
  func xmppStream(sender: XMPPStream?, didReceiveIQ: XMPPIQ?) -> Bool {
    if let iq = didReceiveIQ {
      println("didReceiveIQ: \(iq)")
      
      if iq.isResultIQ() {
        
      }
    }
    
    return false
  }
  
  func xmppStream(sender: XMPPStream?, didReceiveMessage: XMPPMessage?) {
    if let message = didReceiveMessage {
      println("didReceiveMessage: \(message)")
      if let msg: String = message.elementForName("body")?.stringValue() {
        if let from: String = message.attributeForName("from")?.stringValue() {
          var m: NSMutableDictionary = [:]
          m["msg"] = msg
          m["sender"] = from
          //println("messageReceived")
          //messageDelegate?.newMessageReceived(m)
        }
      } else { return }
    }
  }
  
  func xmppStream(sender: XMPPStream?, didReceivePresence: XMPPPresence?) {
    //    println("didReceivePresence")
    
    if let presence = didReceivePresence? {
      var presenceType = presence.type()
      var myUsername = sender?.myJID.user
      var presenceFromUser = presence.from().user
      
      println("didReceivePresence from \(presence.fromStr())")
    }
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}

