//
//  CoinPoint.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/28/22.
//

import Foundation
import MapKit

class CoinPointModel: Identifiable, ObservableObject {
  let id: UUID = UUID()
  var title: String
  var subtitle: String
  var coinType: String
  var amount: Double
  var lat: Double
  var lon: Double
  var alt: Double // Level point under Sea
  var height: Double // Heght up on altitude
  
  @Published var address: String = ""
  
  init(title: String, subtitle: String, coinType: String, amount: Double, lat: Double, lon: Double, alt: Double = 0.0, height: Double = 0.0) {
    self.title = title
    self.subtitle = subtitle
    self.coinType = coinType
    self.amount = amount
    self.lat = lat
    self.lon = lon
    self.alt = alt
    self.height = height
  }
  
  var fullHeight: Double {
    alt + height
  }
  
//  INFO: Impossible calculate
//  var elevation: Double{
//    self.coordinate.altitude
//  }
  
  // INFO: Use in .onApear block as @ObservedObject
  // @ObservedObject private var point = CoinPointModel.dashkaPoints[0]
  // view {
  // Text(point.address)
  //  .onAppear(perform: {
  //    point.asyncGetAddress()
  //  })
  // }
  func asyncGetAddress() -> Void {
    let ceo: CLGeocoder = CLGeocoder()
    
    ceo.reverseGeocodeLocation(coordinate) { (placemarks, error) -> Void in
      if let error = error {
        print("Geo ERR: \(error)")
        return
      }
      guard let placemarks = placemarks else {
        print("placemarks is nil")
        return
      }
      
      if placemarks.count > 0 {
        let placemark = placemarks[0]
        
        DispatchQueue.main.async {
          self.address = GeoLocation(with: placemark).fullAddress
        }
      }
    }
  }
  
  var coordinate2D: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: self.lat, longitude: self.lon)
  }
  
  var coordinate: CLLocation {
    let cLLocation = CLLocation(latitude: self.lat, longitude: self.lon)
    
    return cLLocation
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
  
  static var dashkaPoints: [CoinPointModel] {
    [
      CoinPointModel(title: "D1", subtitle: "Alt 10m", coinType: "coin", amount: 777, lat: 50.484497, lon: 30.602798, alt: 10, height: 0),
      CoinPointModel(title: "D2", subtitle: "Alt 50m", coinType: "coin", amount: 777, lat: 50.484444, lon: 30.602435, alt: 50, height: 0),
      CoinPointModel(title: "D3", subtitle: "Alt 100m", coinType: "coin", amount: 33, lat: 50.483651, lon: 30.599027, alt: 100, height: 0),
      CoinPointModel(title: "D4", subtitle: "Alt 500m", coinType: "coin", amount: 33, lat: 50.482169, lon: 30.599883, alt: 500, height: 0)
    ]
  }
    
  static var points: [CoinPointModel] {
//    dashkaPoints  //+ obolonPoints
    dashkaPoints
  }
  
  static var obolonPoints: [CoinPointModel] {
    [
      CoinPointModel(title: "SOVA", subtitle: "Naberezhnaya 1", coinType: "coin", amount: 11, lat: 50.512796, lon: 30.513888),
      CoinPointModel(title: "Naberegn 2", subtitle: "Naberezhnaya 2", coinType: "coin", amount: 28, lat: 50.512179, lon: 30.513546),
      CoinPointModel(title: "Naberegn 3", subtitle: "Naberezhnaya 3", coinType: "coin", amount: 54, lat: 50.510910, lon: 30.513417),
      CoinPointModel(title: "Naberegn 4", subtitle: "Naberezhnaya 4", coinType: "coin", amount: 32, lat: 50.510832, lon: 30.513184),
      CoinPointModel(title: "Obolon Lypky", subtitle: "Lypki na Oboloni", coinType: "coin", amount: 86, lat: 50.512236, lon: 30.510654),
      CoinPointModel(title: "Naberegn 6", subtitle: "Naberezhnaya 6", coinType: "coin", amount: 36, lat: 50.513594, lon: 30.514503),
      CoinPointModel(title: "Zamahnut po 50", subtitle: "Naberezhnaya 7", coinType: "coin", amount: 334, lat: 50.505670, lon: 30.514681),
      CoinPointModel(title: "Zamahnut po 50", subtitle: "Naberezhnaya 7", coinType: "coin", amount: 334, lat: 50.505670, lon: 30.514681),
      CoinPointModel(title: "Eshe po 50", subtitle: "Naberezhnaya 1", coinType: "coin", amount: 77, lat: 50.505138, lon: 30.515075),
      CoinPointModel(title: "Eshe po 100", subtitle: "Naberezhnaya 2", coinType: "coin", amount: 64, lat: 50.504778, lon: 30.515334),
      CoinPointModel(title: "Dom 3", subtitle: "Naberezhnaya 3", coinType: "coin", amount: 42, lat: 50.512003, lon: 30.491306),
      CoinPointModel(title: "Dom 4", subtitle: "Naberezhnaya 4", coinType: "coin", amount: 200, lat: 50.512839, lon: 30.491167)
    ]
  }
  
  
  static var arsPoints: [CoinPointModel] {
    [
      CoinPointModel(title: "Office UP 100m", subtitle: "Alt 100m", coinType: "coin", amount: 323, lat:50.44269993709849, lon: 30.546135071855485, alt: 200.0, height: 100),
      CoinPointModel(title: "Coin Point", subtitle: "Shari", coinType: "coin", amount: 33.74, lat: 50.443262, lon: 30.544960,alt: 200.0, height: 50),
      CoinPointModel(title: "Arsenal 1", subtitle: "Near Balls 1", coinType: "coin", amount: 23, lat: 50.443480, lon: 30.544884, alt: 200.0, height: 100),
      CoinPointModel(title: "Arsenal 2", subtitle: "Near Balls 2", coinType: "coin", amount: 45, lat: 50.443254, lon: 30.544798, alt: 200.0, height: 150)
//      CoinPointModel(title: "Arsenal 3", subtitle: "Near Balls 3", coinType: "coin",amount: 69, lat: 50.442964, lon: 30.544767),
//      CoinPointModel(title: "Arsenal 4", subtitle: "Alleya 1", coinType: "coin", amount: 123, lat: 50.442584, lon: 30.544261),
//      CoinPointModel(title: "Arsenal 5", subtitle: "Alleya 2", coinType: "coin",amount: 17, lat: 50.442458, lon: 30.544149),
//      CoinPointModel(title: "Arsenal 6", subtitle: "Alleya 3", coinType: "coin",amount: 2, lat: 50.442195, lon: 30.544037),
//      CoinPointModel(title: "Arsenal 7", subtitle: "Alleya 4", coinType: "coin", amount: 99, lat: 50.441912, lon: 30.543998),
//      CoinPointModel(title: "Arsenal 8", subtitle: "Alleya 5", coinType: "coin", amount: 42, lat: 50.441962, lon: 30.543630),
//      CoinPointModel(title: "Arsenal 9", subtitle: "Kiosk 1", coinType: "coin", amount: 31, lat: 50.442863, lon: 30.545067),
//      CoinPointModel(title: "Arsenal 10", subtitle: "Kiosk 2", coinType: "coin", amount: 16, lat: 50.442797, lon: 30.544945)
    ]
  }
}



struct GeoLocation {
  let name: String
  let streetName: String
  let city: String
  let state: String
  let zipCode: String
  let country: String
  
  init(with placemark: CLPlacemark) {
    self.name           = placemark.name ?? ""
    self.streetName     = placemark.thoroughfare ?? ""
    self.city           = placemark.locality ?? ""
    self.state          = placemark.administrativeArea ?? ""
    self.zipCode        = placemark.postalCode ?? ""
    self.country        = placemark.country ?? "Ukraine"
  }
  
  var fullAddress: String {
    return "\(name),  \(zipCode), \(country)"
  }
}


//        addressString
//        if rGl.name != nil
//        if pm.subThoroughfare != nil {
//          addressString = addressString + pm.subThoroughfare! + ", "
//        }
//
//        if pm.subLocality != nil {
//          addressString = addressString + pm.subLocality! + ", "
//        }
//        if pm.thoroughfare != nil {
//          addressString = addressString + pm.thoroughfare! + ", "
//        }
//        if pm.locality != nil {
//          addressString = addressString + pm.locality! + ", "
//        }
//        if pm.country != nil {
//          addressString = addressString + pm.country! + ", "
//        }
//        if pm.postalCode != nil {
//          addressString = addressString + pm.postalCode! + " "
//        }
