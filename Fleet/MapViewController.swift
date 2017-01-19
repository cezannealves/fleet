//
//  MapViewController.swift
//  Fleet
//
//  Created by Student on 1/19/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.showsUserLocation = true
        //setupLocationMaganer()
        
        //get_data_from_url("http://data.sparkfun.com/output/v0vmXEGgQmuOM1W40DN6.json")
        
        let trajeto: [Trajetoria] = TrajetoriaDao.searchAll()
        //var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        
        for point in trajeto{
           // points.append(CLLocationCoordinate2DMake(Double(point.latitude!)!, Double(point.longitude!)!))
            addMarkerToMap(lat: Double(point.latitude!)!, lon: Double(point.longitude!)!, placa: String(point.placa!)!, time: String(point.time!)!)

        }
        
      //  let polyline = MKPolyline(coordinates: &amp;points, count: trajeto.count)
        
        //self.map.addOverlays(polyline)

        // Do any additional setup after loading the view.
    }
    
    
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
            self.extract_json(data!)
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
                                                addMarkerToMap(lat: Double(latitude)!, lon: Double(longitude)!, placa: String(placa)!, time: String(times))
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

    
    func addMarkerToMap (lat: Double, lon: Double, placa: String, time: String) {
        //let newCoordenate: CLLocationCoordinate2D = map.convert(coordenate: touchP, toPointTo: map)
        // identificando o ponto do mapa que foi pressionado
        //let touchPoint = gestureRecognizer.location(in: self.map)
        let newCoordinate = CLLocationCoordinate2DMake(lat, lon)
        
        // criando a nova annotation
        let newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = newCoordinate
        newAnnotation.title = placa
        newAnnotation.subtitle = time
        
        map.addAnnotation(newAnnotation)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
