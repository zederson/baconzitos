import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var imageField : UIImageView?
    @IBOutlet var label : UILabel?
    
    var locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: UUID(uuidString: "FDA50693-A4E2-4FB1-AFCF-C6EB07647825")!, identifier: "Ze")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.startRangingBeacons(in: region)
        showImageBall(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.unknown }
        
        if (knownBeacons.count > 0) {
            let closestBeacon = knownBeacons[0] as CLBeacon
            
            if let labelField = label {
                labelField.text = String(format: "%.3f Metros", Double(closestBeacon.accuracy.description)!)
            }
            
            if closestBeacon.accuracy < 0.80 {
                showImageBall(true)
                
            } else {
                showImageBall(false)
            }
        }
    }
    
    func showImageBall(_ flag: Bool) {
        if let imageView = imageField {
            var image : UIImage?
            
            if flag {
                image = UIImage(named: "esfera.png")
            } else {
                image = UIImage(named: "radar.png")
            }

            imageView.image = image
        }
    }
}
