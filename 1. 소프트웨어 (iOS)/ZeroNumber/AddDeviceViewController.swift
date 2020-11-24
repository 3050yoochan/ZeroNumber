//
//  AddDeviceViewController.swift
//  ZeroNumber
//
//  Created by Yoochan Oh on 2020/10/11.
//  Copyright © 2020 Yoochan. All rights reserved.
//

import UIKit
import CoreBluetooth

class AddDeviceViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    

    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    var characteristic : CBCharacteristic!
    var centralManager: CBCentralManager!
    var myPeripheral: CBPeripheral!
    var txCharacteristic : CBCharacteristic!
    var arrayReadWriteChar = [CBCharacteristic]()
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
            if central.state == CBManagerState.poweredOn {
                print("BLE powered on")
                // Turned on
            }
            else {
                print("Something wrong with BLE")
                // Not on, but can have different issues
            }
        
            central.scanForPeripherals(withServices: nil, options: nil)
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let pname = peripheral.name {
                    print(pname)
                }
        
        if let pname = peripheral.name {
            if pname == "HMSoft" {
                self.ActivityIndicator.color = .green
                self.centralManager.stopScan()
                
                self.myPeripheral = peripheral
                self.myPeripheral.delegate = self
         
                self.centralManager.connect(peripheral, options: nil)
               
                
            }
        }
    }
    
    
    
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        self.myPeripheral.discoverServices(nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        ActivityIndicator.startAnimating()
        

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
