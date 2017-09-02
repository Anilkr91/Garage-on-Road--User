//
//  AppDelegate.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/16/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import CoreLocation
import GooglePlaces
import GoogleMaps
import MapKit
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var locationManager = CLLocationManager()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupCoreLocation()
        setupGoogleMaps()
        setupPageControlAppearance()
        IQKeyboardManager.shared().isEnabled = true

        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
        func setHomeUserAsRVC() {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeNavigationController")
            window?.rootViewController = vc
        }
    
    
}

extension AppDelegate: CLLocationManagerDelegate {
    
    func setupCoreLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func startLocationUpdates() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
            
        case .denied:
            print(".Denied")
            break
            
        default:
            print("Undefined authorization status")
            break
        }
    }
    
    func stopLocationUpdates() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        startLocationUpdates()
    }
    
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //
    //        let userLocation:CLLocation = locations[0]
    //        let long = userLocation.coordinate.longitude;
    //        let lat = userLocation.coordinate.latitude;
    //        print(userLocation)
    //        print(long)
    //        print(lat)
    //        stopLocationUpdates()
    //
    //    }
    
    func setupGoogleMaps() {
        
//        GMSServices.provideAPIKey("AIzaSyDckYWwvgztf9mDUn4Xzxib-OqCKsQfRZ8")
        GMSPlacesClient.provideAPIKey("AIzaSyDckYWwvgztf9mDUn4Xzxib-OqCKsQfRZ8")
    }
    
    func setupPageControlAppearance() {
        let pageControlAppearance = UIPageControl.appearance()
        pageControlAppearance.pageIndicatorTintColor = UIColor.red
    }
    
}
