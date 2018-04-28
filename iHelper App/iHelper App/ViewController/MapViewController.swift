//
//  MapViewController.swift
//  iHelper App
//
//  Created by Habib Gramondi on 28/04/2018.
//  Copyright © 2018 Habib Gramondi. All rights reserved.
//

import UIKit

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        if let user = CLLocationManager().location {
            // obtenemos la ubicacion actual del usuario (coordenadas, altitud, orientacion, etc)
            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            let region = MKCoordinateRegion(center: user.coordinate, span: span)
            // region es un area determinada por:
            //      un punto central (la ubicacion del usuario)
            //      un radio
            mapView.setRegion(region, animated: true)
        }
        
        setPlace()
    }
    
    private func setPlace() {
        // annotation son los elementos que se muestran en el mapa, que son configurables con ubicacion, titulo y subtitulo
        let dhCoordinate = CLLocationCoordinate2D(latitude: -34.5487581, longitude: -58.4439435)
        let dhPlace = Place(title: "iHelper", subtitle: "Corredor Bancalari 3901", coordinate: dhCoordinate)
        mapView.addAnnotation(dhPlace)
    }

    @IBAction func toggleUser(_ sender: Any) {
    mapView.showsUserLocation = !mapView.showsUserLocation
    }
    
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // las annotation del mapa son reusables...
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            // si puedo reusar una annotation ya creada, la configuro
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // sino, la creo y luego la configuro
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        // delegate que se ejecuta cuando el usuario toca en la informacion de un annotation
        if let location = view.annotation as? Place {
            let placemark = MKPlacemark(coordinate: location.coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.openInMaps(launchOptions: nil)
        }
    }
    
}
