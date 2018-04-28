//
//  MiniLabViewController.swift
//  iHelper App
//
//  Created by Habib Gramondi on 28/04/2018.
//  Copyright © 2018 Habib Gramondi. All rights reserved.
//

import UIKit

import UIKit
import CoreLocation

//  CORELOCATION es el framework que permite hacer uso del GPS
//  Para poder usarlo es necesario configurar las siguientes claves el info.plist:
//      NSLocationAlwaysAndWhenInUseUsageDescription
//      NSLocationWhenInUseUsageDescription

class MiniLabViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    // Un CoreLocation-LocationManager para poder monitorear los cambios del GPS.
    private var clManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clManager.delegate = self
    }
    
    private func manageStatus() {
        let status = CLLocationManager.authorizationStatus()
        
        if status == .authorizedAlways {
            // Significa que el usuario autorizo a la aplicacion a usar el GPS siempre (aun en background)
            showAlert("AUTHORIZATION", "ALWAYS")
            start()
            
        } else if status == .authorizedWhenInUse {
            // Significa que el usuario autorizo a la aplicacion a usar el GPS solo mientras la app este en uso
            showAlert("AUTHORIZATION", "WHEN IN USE")
            start()
            
        } else if status == .restricted {
            // Significa que hay algun tipo de restriccion por la que la aplicacion NO puede usar el GPS
            showAlert("AUTHORIZATION", "RESTRICTED")
            
        } else if status == .denied {
            // Significa que el usuario NO autorizo a la aplicacion a usar el GPS
            showAlert("AUTHORIZATION", "DENIED")
            
        } else {
            // Significa que el usuario aun no determino el acceso de la aplicacion al GPS
            clManager.requestAlwaysAuthorization()
        }
    }
    
    private func start() {
        // startUpdatingLocation() indica al GPS que se quiere empezar a monitorear los cambios de ubicacion
        clManager.startUpdatingLocation()
    }
    
    private func stop() {
        // stopUpdatingLocation() indica al GPS que se quiere dejar de monitorear los cambios de ubicacion
        clManager.stopUpdatingLocation()
    }
    
    private func showAlert(_ title: String? = nil, _ message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - CLLocationManagerDelegate
    // Estos son los metodos del delegate de CoreLocation-LocationManager (CLLocationManager)
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // este metodo se ejecuta cada vez que hay un cambio en la autorizacion de acceso
        manageStatus()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // este metodo se ejecuta cada vez que hay un cambio en la ubicacion del usuario
        if let location = locations.first {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            label.text = "LATITUD\n\(lat)\n\n\nLONGITUD\n\(lon)"
        }
    }
    
}
