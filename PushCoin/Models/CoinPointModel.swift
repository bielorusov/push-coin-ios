//
//  CoinPoint.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/28/22.
//

import Foundation
import MapKit

struct CoinPointModel: Identifiable, Hashable {
  var id: UUID
  var title: String
  var subtitle: String
  var coinType: String
  var amount: Double
  var lat: Double
  var lon: Double
  
  init(id: UUID, title: String, subtitle: String, coinType: String, amount: Double, lat: Double, lon: Double) {
    self.id = id
    self.title = title
    self.subtitle = subtitle
    self.coinType = coinType
    self.amount = amount
    self.lat = lat
    self.lon = lon
  }
  
  
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
    CoinPointModel(id: UUID(),title: "Dashka", subtitle: "Kurnatovskogo", coinType: "coin", amount: 777, lat: 50.484062, lon: 30.599765)
  }
  
  static var arsPoint: CoinPointModel {
    CoinPointModel(id: UUID(),title: "Coin Point", subtitle: "Shari", coinType: "coin", amount: 33.74, lat: 50.443262, lon: 30.544960)
  }
  
  static var points: [CoinPointModel] {
    obolonPoints + arsPoints
  }
  
  static var obolonPoints: [CoinPointModel] {
    [
      CoinPointModel(id: UUID(),title: "SOVA", subtitle: "Naberezhnaya 1", coinType: "coin", amount: 11, lat: 50.512796, lon: 30.513888),
      CoinPointModel(id: UUID(),title: "Naberegn 2", subtitle: "Naberezhnaya 2", coinType: "coin", amount: 28, lat: 50.512179, lon: 30.513546),
      CoinPointModel(id: UUID(),title: "Naberegn 3", subtitle: "Naberezhnaya 3", coinType: "coin", amount: 54, lat: 50.510910, lon: 30.513417),
      CoinPointModel(id: UUID(),title: "Naberegn 4", subtitle: "Naberezhnaya 4", coinType: "coin", amount: 32, lat: 50.510832, lon: 30.513184),
      CoinPointModel(id: UUID(),title: "Obolon Lypky", subtitle: "Lypki na Oboloni", coinType: "coin", amount: 86, lat: 50.512236, lon: 30.510654),
      CoinPointModel(id: UUID(),title: "Naberegn 6", subtitle: "Naberezhnaya 6", coinType: "coin", amount: 36, lat: 50.513594, lon: 30.514503),
      CoinPointModel(id: UUID(),title: "Zamahnut po 50", subtitle: "Naberezhnaya 7", coinType: "coin", amount: 334, lat: 50.505670, lon: 30.514681),
      CoinPointModel(id: UUID(),title: "Zamahnut po 50", subtitle: "Naberezhnaya 7", coinType: "coin", amount: 334, lat: 50.505670, lon: 30.514681),
      CoinPointModel(id: UUID(),title: "Eshe po 50", subtitle: "Naberezhnaya 1", coinType: "coin", amount: 77, lat: 50.505138, lon: 30.515075),
      CoinPointModel(id: UUID(),title: "Eshe po 100", subtitle: "Naberezhnaya 2", coinType: "coin", amount: 64, lat: 50.504778, lon: 30.515334),
      CoinPointModel(id: UUID(),title: "Dom 3", subtitle: "Naberezhnaya 3", coinType: "coin", amount: 42, lat: 50.512003, lon: 30.491306),
      CoinPointModel(id: UUID(),title: "Dom 4", subtitle: "Naberezhnaya 4", coinType: "coin", amount: 200, lat: 50.512839, lon: 30.491167)
    ]
  }
  
  
  static var arsPoints: [CoinPointModel] {
    [
      arsPoint,
      point,
      CoinPointModel(id: UUID(),title: "Arsenal 1", subtitle: "Near Balls 1", coinType: "coin", amount: 23, lat: 50.443480, lon: 30.544884),
      CoinPointModel(id: UUID(),title: "Arsenal 2", subtitle: "Near Balls 2", coinType: "coin", amount: 45, lat: 50.443254, lon: 30.544798),
      CoinPointModel(id: UUID(),title: "Arsenal 3", subtitle: "Near Balls 3", coinType: "coin",amount: 69, lat: 50.442964, lon: 30.544767),
      CoinPointModel(id: UUID(),title: "Arsenal 4", subtitle: "Alleya 1", coinType: "coin", amount: 123, lat: 50.442584, lon: 30.544261),
      CoinPointModel(id: UUID(),title: "Arsenal 5", subtitle: "Alleya 2", coinType: "coin",amount: 17, lat: 50.442458, lon: 30.544149),
      CoinPointModel(id: UUID(),title: "Arsenal 6", subtitle: "Alleya 3", coinType: "coin",amount: 2, lat: 50.442195, lon: 30.544037),
      CoinPointModel(id: UUID(),title: "Arsenal 7", subtitle: "Alleya 4", coinType: "coin", amount: 99, lat: 50.441912, lon: 30.543998),
      CoinPointModel(id: UUID(),title: "Arsenal 8", subtitle: "Alleya 5", coinType: "coin", amount: 42, lat: 50.441962, lon: 30.543630),
      CoinPointModel(id: UUID(),title: "Arsenal 9", subtitle: "Kiosk 1", coinType: "coin", amount: 31, lat: 50.442863, lon: 30.545067),
      CoinPointModel(id: UUID(),title: "Arsenal 10", subtitle: "Kiosk 2", coinType: "coin", amount: 16, lat: 50.442797, lon: 30.544945)
    ]
  }
}

