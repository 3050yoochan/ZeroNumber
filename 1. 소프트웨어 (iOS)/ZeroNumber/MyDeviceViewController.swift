//
//  MyDeviceViewController.swift
//  ZeroNumber
//
//  Created by Yoochan Oh on 2020/10/11.
//  Copyright © 2020 Yoochan. All rights reserved.
//

import UIKit

class MyDeviceViewController: UIViewController {

    @IBOutlet weak var CarPlateLabel: UILabel!
    @IBOutlet weak var ShowQRButton: UIButton!
    @IBOutlet weak var BlindQRButton: UIButton!
    @IBOutlet weak var StatusTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ShowQRButton.layer.cornerRadius = 10.0
        ShowQRButton.layer.masksToBounds = true
        BlindQRButton.layer.cornerRadius = 10.0
        BlindQRButton.layer.masksToBounds = true
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        
        CarPlateLabel.text = vc.myCarPlate
        
        StatusTextView.isEditable = false
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

/*
 if isMyPeripheralConected {

     let dataToSend: Data = "01".data(using: String.Encoding.utf8)!

     print(dataToSend)

     let command:[UInt8] = [0x01]

     let sendData:Data = Data(command)

     myBluetoothPeripheral.writeValue(sendData, for: self.arrayReadWriteChar[0], type: .withResponse)
 }
 else {

     print("Not connected")
 }
 
 https://stackoverflow.com/questions/47139946/read-and-write-data-in-ble-for-led-turn-on-off-in-swift
 */
