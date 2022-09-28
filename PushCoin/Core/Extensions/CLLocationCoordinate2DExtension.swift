//
//  CLLocationCoordinate2DExtension.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/28/22.
//
//https://www.omnicalculator.com/other/azimuth#what-is-the-azimuth

import Foundation
import MapKit

extension CLLocationCoordinate2D {
  func getRadiansFrom(degrees: Double ) -> Double {
    return degrees * .pi / 180
  }
  
  func getDegreesFrom(radians: Double) -> Double {
    return radians * 180 / .pi
  }
  
  public func bearing(location: CLLocationCoordinate2D) -> Double {
    let lat1 = self.getRadiansFrom(degrees:self.latitude)
    let long1 = self.getRadiansFrom(degrees:self.longitude)
    let lat2 = self.getRadiansFrom(degrees:location.latitude)
    let long2 = self.getRadiansFrom(degrees:location.longitude)
    
//    let deltaLat = lat2 - lat1
//    let deltaLong = long2 - long1
//    let res = atan2(sin(deltaLong) * cos(lat2), cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(deltaLong))
        
    let deltaLat = log(tan(lat2/2 + .pi/4)/tan(lat1/2 + .pi/4))
    var deltaLong = (long2-long1)
//
    if(deltaLong > .pi){
      deltaLong = (long1-long2)
    }
    
    let azimuth = self.getDegreesFrom(radians: atan2(deltaLong, deltaLat))
//
//    return self.getDegreesFrom(radians: res)
    return azimuth < 0 ? abs(azimuth) + 180 : azimuth
  }
}
