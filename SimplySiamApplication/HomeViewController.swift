//
//  HomeViewController.swift
//  SimplySiamApplication
//
//  Created by student on 2/10/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import GoogleSignIn

class HomeViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBAction func NumberOfGuests(_ sender: UIStepper) {
        let number:Int = Int(sender.value)
        totalGuestsNumber.text = "\(number)"
    }
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet weak var totalGuestsNumber: UILabel!
    @IBOutlet weak var totalGuestsLBL: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var eventTypePicker: UIPickerView! = UIPickerView()
    
    var pickerList = ["Dine In", "Take Away","Delivery"]
    
    @IBAction func Logout(_ sender: Any) {
        loggedUserName = ""
        loggedUserEmail = ""
        loggedUserPhone = ""
        loggedUserAddress = ""
        loggedUserCity = ""
        loggedUserState = ""
        loggedUserZip = ""
        isUserLoggedIn = false
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            GIDSignIn.sharedInstance().signOut()
            print("log out")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! UIViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = loginVC
    }
    
    @IBAction func getDirections(_ sender: Any) {
        let latitude: CLLocationDegrees = 40.3484
        let longitude: CLLocationDegrees = -94.8730
        
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Simply Siam"
        mapItem.openInMaps(launchOptions: options)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        datePicker.isHidden = true
        totalGuestsLBL.isHidden = true
        totalGuestsNumber.isHidden = true
        stepperOutlet.isHidden = true
        eventTypePicker.delegate = self
        eventTypePicker.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int
        ) -> String? {
        return pickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerList[eventTypePicker.selectedRow(inComponent: 0)] == "Delivery" {
            datePicker.isHidden = false
            totalGuestsLBL.isHidden = true
            totalGuestsNumber.isHidden = true
            stepperOutlet.isHidden = true
        }else if pickerList[eventTypePicker.selectedRow(inComponent: 0)] == "Take Away" {
            datePicker.isHidden = false
            totalGuestsLBL.isHidden = true
            totalGuestsNumber.isHidden = true
            stepperOutlet.isHidden = true
        }else if pickerList[eventTypePicker.selectedRow(inComponent: 0)] == "Dine In" {
            datePicker.isHidden = false
            totalGuestsLBL.isHidden = false
            totalGuestsNumber.isHidden = false
            stepperOutlet.isHidden = false
        }else{
            datePicker.isHidden = true
            totalGuestsLBL.isHidden = true
            totalGuestsNumber.isHidden = true
            stepperOutlet.isHidden = true
        }
    }
}
