//
//  AppDelegate.swift
//  Fleet
//
//  Created by Student on 1/17/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        
        
        func get_data_from_url(_ link:String) {
            let url:URL = URL(string: link)!
            let session = URLSession.shared
            
            let request = NSMutableURLRequest(url: url)
            request.httpMethod = "GET"
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {
                (data, response, error) in
                
                guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                    return
                }
                extract_json(data!)
            })
            task.resume()
        }
        
        
        func extract_json(_ data: Data)  {
            let json: Any?
            
            do {
                json = try JSONSerialization.jsonObject(with: data, options: [])
            } catch {
                return
            }
            
            guard let data_list = json as? NSArray else {
                return
            }
            var ponto : Trajetoria
            
            if let positions_list = json as? NSArray {
                for i in 0 ..< data_list.count {
                    if let positions_obj = positions_list[i] as? NSDictionary {
                        if let latitude = positions_obj["latitude"] as? String {
                            if let longitude = positions_obj["longitude"] as? String {
                                if let speed = positions_obj["speed"] as? String {
                                    if let placa = positions_obj["placa"] as? String {
                                        if let altitude = positions_obj["altitude"] as? String {
                                            if let times = positions_obj["timestamp"] as? String {
                                                if (latitude != "0.0") && (longitude != "0.0") {
                                                    print(latitude + "," + longitude + " [" + speed + "] - " + placa + " [" + altitude + "]" )
                                                    //addMarkerToMap(lat: Double(latitude)!, lon: Double(longitude)!, placa: String(placa)!, time: String(times))
                                                    
                                                    ponto = Trajetoria()
                                                    ponto.latitude = latitude
                                                    ponto.longitude = longitude
                                                    ponto.time = times
                                                    ponto.placa =  placa
                                                    
                                                    TrajetoriaDao.insert()
                                                    
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        //get_data_from_url("http://data.sparkfun.com/output/v0vmXEGgQmuOM1W40DN6.json")
        
        
        
        
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
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataManager.saveContext()
    }

}

