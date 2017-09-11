//
//  ViewController.swift
//  WebViewPractise
//
//  Created by Saiteja Alle on 8/27/17.
//  Copyright © 2017 Saiteja Alle. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate {

    var centralManager:CBCentralManager!
    var sensorTag:CBPeripheral?
    var keepScanning:Bool!
    var timeInterval:Timer!
    let timeScanInterval = 2
    var state:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self,
                                          queue: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state {
        
        case .poweredOn:
            // 1
            keepScanning = true
            // 2
            timeInterval = Timer(timeInterval: timeScanInterval, target: self, selector: #selector(pauseScan), userInfo: nil, repeats: false)
            // 3
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        case .poweredOff:
            state = "Bluetooth on this device is currently powered off."
        case .unsupported:
            state = "This device does not support Bluetooth Low Energy."
        case .unauthorized:
            state = "This app is not authorized to use Bluetooth Low Energy."
        case .resetting:
            state = "The BLE Manager is resetting; a state update is pending."
        case .unknown:
            state = "The state of the BLE Manager is unknown."
            
        }
        
    }
    
    @IBAction func scanForDevices(_ sender: Any) {
    
    }

}

