//
//  ViewController.swift
//  TestSegueRouteDemo
//
//  Created by Anil Kumar on 4/30/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces
import GoogleMaps
import LiquidFloatingActionButton
import CoreLocation

class ViewController: UIViewController {

    var cells: [LiquidFloatingCell] = []
    var floatingActionButton: LiquidFloatingActionButton!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var pickupNow: UIButton!
    @IBOutlet weak var locationButton: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationTextField: UITextField!
    var userPlace: CLLocationCoordinate2D? = nil
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("in view will appear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("in view did appear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" in viewdidload")
        
        setupController()
//        let textfield = UITextField()
//        textfield.placeholder = "Enter the address"
//        navigationItem.titleView = textfield
        navigationItem.addTitleAndSubtitleToNavigationBar()
        navigationItem.title = "tree"
        
    }
    
    func setupController() {
        setupMapView()
        setupFab()
        setupSideMenu()
        setupButtons()
    }
    
    func setupMapView() {
        mapView.mapType = .standard
        mapView.showsUserLocation = true
    }
    
    func setupSideMenu() {
        menuButton.target = self
        menuButton.action = #selector(toggleSideMenuView)
    }
    
    func setupButtons() {
        locationTextField.addTarget(self, action: #selector(ViewController.autoCompleteAddress(sender:)), for: UIControlEvents.editingDidBegin)
        pickupNow.addTarget(self, action: #selector(self.pickUp(sender:)), for: UIControlEvents.touchUpInside)
         locationButton.action = #selector(fetchCurrentCoordinates)
    }

    func pickUp(sender: UIButton) {
 print("pickup")
    }
    
    func autoCompleteAddress(sender: UITextField) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        self.present(autocompleteController, animated: true, completion: nil)
        
    }
    
    func fetchCurrentCoordinates(cordinate: CLLocationCoordinate2D) {
        // todo:  func to return singleton of appdel in appdelegate
        
        let application = UIApplication.shared.delegate as! AppDelegate
        application.setupCoreLocation()

        mapView.setCenter(CLLocationCoordinate2D(latitude: cordinate.latitude, longitude: cordinate.longitude), animated: true)
         mapViewMakePoint(cordinate:cordinate)
    }
    
    func setupNavigationBar() {
    
    }
    
}

extension ViewController: LiquidFloatingActionButtonDataSource {
    
    func numberOfCells(_ liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
        return cells.count
    }
    
    func cellForIndex(_ index: Int) -> LiquidFloatingCell {
        return cells[index]
    }
}

extension ViewController: LiquidFloatingActionButtonDelegate {
    func liquidFloatingActionButton(_ liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int) {
        print("did Tapped! \(index)")
        liquidFloatingActionButton.close()
        hideSideMenuView()
    }
    
    func setupFab() {
        let createButton: (CGRect, LiquidFloatingActionButtonAnimateStyle) -> LiquidFloatingActionButton = { (frame, style) in
            let floatingActionButton = CustomDrawingActionButton(frame: frame)
            floatingActionButton.animateStyle = style
            floatingActionButton.dataSource = self
            floatingActionButton.delegate = self
            return floatingActionButton
        }
        
        let cellFactory: (String) -> LiquidFloatingCell = { (iconName) in
            let cell = LiquidFloatingCell(icon: UIImage(named: iconName)!)
            return cell
        }
        
        let customCellFactory: (String) -> LiquidFloatingCell = { (iconName) in
            let cell = CustomCell(icon: UIImage(named: iconName)!, name: iconName)
            return cell
        }
        cells.append(cellFactory("ic_cloud"))
        cells.append(customCellFactory("ic_system"))
        cells.append(cellFactory("ic_place"))
        
        let floatingFrame = CGRect(x: self.view.frame.width - 56 - 16, y: self.view.frame.height - 100 - 15, width: 56, height: 56)
        let bottomRightButton = createButton(floatingFrame, .up)
        
        let image = UIImage(named: "ic_art")
        bottomRightButton.image = image
        self.view.addSubview(bottomRightButton)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapViewMakePoint(cordinate: userLocation.coordinate)
    }
    
    func mapViewMakePoint(cordinate: CLLocationCoordinate2D) {
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(cordinate, span)
        mapView.setRegion(self.mapView.regionThatFits(region), animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = cordinate;
        point.title = "Where am I?";
        point.subtitle = "I'm here!!!";
        mapView.addAnnotation(point)
    }
}

extension ViewController: GMSAutocompleteViewControllerDelegate {
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        print(place.coordinate.latitude)
        print(place.coordinate.longitude)
        
        for i in 0..<place.addressComponents!.count-1 {

            let types = place.addressComponents![i].type
            if types.contains("country") {
            
            }
            if types.contains("locality") {
                print(place.addressComponents![i].name)
            }
            if types.contains("administrative_area_level_1") {
                 print(place.addressComponents![i].name)
            }
            if types.contains("postal_code") {
            print(place.addressComponents![i].name)
            }
        }
        fetchCurrentCoordinates(cordinate: place.coordinate)
        self.dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print(error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
