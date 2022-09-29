//
//  CoinPoint.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/28/22.
//

import Foundation
import MapKit

struct CoinPointModel: Identifiable {
  var id = UUID()
  var title: String
  var subtitle: String
  var coinType: String
  var amount: Float
  var lat: Double
  var lon: Double
  
  var coordinate2D: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: self.lat, longitude: self.lon)
  }
  
  var coordinate: CLLocation {
    CLLocation(latitude: self.lat, longitude: self.lon)
  }

  func bearing(from point: CLLocationCoordinate2D) -> Double {
    return point.bearing(to: self.coordinate2D)
  }
  
  func distance(from point: CLLocationCoordinate2D) -> Double {
    return coordinate2D.distance(from: point)
  }

  var mkPointAnotation: MKPointAnnotation {
    let point = MKPointAnnotation()
    point.title = self.title
    point.subtitle = self.subtitle
    point.coordinate = self.coordinate2D
    
    return point
  }
  
  static var point: CoinPointModel {
    CoinPointModel(title: "Dashka", subtitle: "Kurnatovskogo", coinType: "coin", amount: 777, lat: 50.484062, lon: 30.599765)
  }
  
  static var points: [CoinPointModel] {
    [
      point,
      CoinPointModel(title: "Arsenal 1", subtitle: "Near Balls 1", coinType: "coin", amount: 23, lat: 50.443480, lon: 30.544884),
      CoinPointModel(title: "Arsenal 2", subtitle: "Near Balls 2", coinType: "coin", amount: 45, lat: 50.443254, lon: 30.544798),
      CoinPointModel(title: "Arsenal 3", subtitle: "Near Balls 3", coinType: "coin",amount: 69, lat: 50.442964, lon: 30.544767),
      CoinPointModel(title: "Arsenal 4", subtitle: "Alleya 1", coinType: "coin", amount: 123, lat: 50.442584, lon: 30.544261),
      CoinPointModel(title: "Arsenal 5", subtitle: "Alleya 2", coinType: "coin",amount: 17, lat: 50.442458, lon: 30.544149),
      CoinPointModel(title: "Arsenal 6", subtitle: "Alleya 3", coinType: "coin",amount: 2, lat: 50.442195, lon: 30.544037),
      CoinPointModel(title: "Arsenal 7", subtitle: "Alleya 4", coinType: "coin", amount: 99, lat: 50.441912, lon: 30.543998),
      CoinPointModel(title: "Arsenal 8", subtitle: "Alleya 5", coinType: "coin", amount: 42, lat: 50.441962, lon: 30.543630),
      CoinPointModel(title: "Arsenal 9", subtitle: "Kiosk 1", coinType: "coin", amount: 31, lat: 50.442863, lon: 30.545067),
      CoinPointModel(title: "Arsenal 10", subtitle: "Kiosk 2", coinType: "coin", amount: 16, lat: 50.442797, lon: 30.544945)
    ]
  }
}

