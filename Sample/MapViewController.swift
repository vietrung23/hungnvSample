//
//  MapViewController.swift
//  Sample
//
//  Created by N2N Connect on 5/10/20.
//  Copyright © 2020 N2N Connect. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapView: MKMapView!
    
    override func loadView() {
        
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        // Layout
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
//        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let topConstraint = NSLayoutConstraint(item: segmentedControl, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)

        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // Colour view
        let colourView = UIView()
        colourView.backgroundColor = .yellow
        colourView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colourView)
        let hAlignCenterContraint = colourView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let vAlignCenterContraint = colourView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthContraint = colourView.widthAnchor.constraint(equalToConstant: 100)
        let aspectRatioContraint = NSLayoutConstraint(item: colourView,
                                                      attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: colourView,
                                                      attribute: .height,
                                                      multiplier: 1,
                                                      constant: 0)
        hAlignCenterContraint.isActive = true
        vAlignCenterContraint.isActive = true
        widthContraint.isActive = true
        aspectRatioContraint.isActive = true
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Map View did load")
    }
    
}
