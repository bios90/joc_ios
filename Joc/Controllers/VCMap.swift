import Foundation
import UIKit
import GoogleMaps
import GooglePlaces

class VCMap: BaseViewContoller,CLLocationManagerDelegate,GMSMapViewDelegate
{
    var locationManager = CLLocationManager()
    var viewMap:VMap?
    
    init()
    {
        super.init(statusColorBlack:true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadViews()
    }
    
    func loadViews()
    {
        viewMap = VMap()
        self.view.addSubview(viewMap!)
        viewMap!.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        viewMap!.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        viewMap!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewMap!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        viewMap!.layoutIfNeeded()
        viewMap!.google_map.delegate = self
        
        setupGeoLocation()
    }
    
    func setupGeoLocation()
    {
        let lat = 55.750249
        let long = 37.594228
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 16.5)
        
        viewMap!.google_map.animate(to: camera)
        
        bind_restaraunts(restaraunts: RepoRestaraunts.getRestaraunts())
        
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        locationManager.startMonitoringSignificantLocationChanges()
//        viewMap!.google_map.isMyLocationEnabled = true
//        viewMap!.google_map.settings.myLocationButton = true
    }
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
//    {
//        locationManager.startUpdatingLocation()
//        viewMap!.google_map.isMyLocationEnabled = true
//        viewMap!.google_map.settings.myLocationButton = true
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        locationManager.delegate = nil
        locationManager.stopUpdatingLocation()
//        let location = locations.last
//        let lat = (location?.coordinate.latitude)!
//        let long = (location?.coordinate.longitude)!
        
        let lat = 55.750249
        let long = 37.594228
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 16.5)
        
        viewMap!.google_map.animate(to: camera)
        
        bind_restaraunts(restaraunts: RepoRestaraunts.getRestaraunts())
    }
    
    func bind_restaraunts(restaraunts:[Model_Restaraunt])
    {
        for (index, restaraunt) in restaraunts.enumerated()
        {
            let view = MarkerView(restaraunt: restaraunt)
            
            let marker = GMSMarker()
            marker.iconView = view
            marker.position = CLLocationCoordinate2D(latitude: restaraunt.lat, longitude: restaraunt.lon)
            marker.map = viewMap?.google_map!
            
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool
    {
        let restaraunt = (marker.iconView as! MarkerView).restaraunt!
        messagesManager!.show_restaraunt_dialog(restaraunt: restaraunt, ok_click:
            {
                self.navigationManager?.toVcCafe(restaraunt: restaraunt)
        })
        
        return true
    }
}
