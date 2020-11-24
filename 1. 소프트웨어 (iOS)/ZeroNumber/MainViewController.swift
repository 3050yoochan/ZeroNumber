//
//  MainViewController.swift
//  ZeroNumber
//
//  Created by Yoochan Oh on 2020/10/07.
//  Copyright © 2020 Yoochan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var myCarPlate:String? = "41구 4664"
    @IBOutlet weak var TakeQRButton: UIButton!
    @IBOutlet weak var AddDeviceButton: UIButton!
    @IBOutlet weak var MyDeviceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.dismiss(animated: true, completion: nil)
        
        TakeQRButton.layer.cornerRadius = 10.0
        TakeQRButton.layer.masksToBounds = true
        AddDeviceButton.layer.cornerRadius = 10.0
        AddDeviceButton.layer.masksToBounds = true
        MyDeviceButton.layer.cornerRadius = 10.0
        MyDeviceButton.layer.masksToBounds = true
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
