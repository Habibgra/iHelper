//
//  Place.swift
//  iHelper App
//
//  Created by Habib Gramondi on 28/04/2018.
//  Copyright © 2018 Habib Gramondi. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    
    var title: String?
    
    var subtitle: String?
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
}
