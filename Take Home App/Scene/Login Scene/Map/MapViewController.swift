import UIKit
import MapKit

class MapViewController: UIViewController {

    // MARK: Properties
    public class var storyboardName: String {
        return "Login"
    }
    
    static func create(viewModel: MapViewModel) -> MapViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: MapViewController.self)) as? MapViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    var viewModel: MapViewModel!
    
    // MARK: IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap(to: viewModel.location, with: viewModel.hotel.title)
    }
}

// MARK: - Methods
private extension MapViewController {
    
    func configureMap(to location: CLLocation, with title: String?) {
        let point = MKPointAnnotation()
        point.title = title ?? ""
        point.coordinate = location.coordinate
        self.mapView.removeAnnotations(self.mapView.annotations)
        self.mapView.addAnnotation(point)
        let viewRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        self.mapView.setRegion(viewRegion, animated: true)
    }
}
