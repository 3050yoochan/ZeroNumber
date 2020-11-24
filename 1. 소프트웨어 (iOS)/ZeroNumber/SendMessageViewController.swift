//
//  SendMessageViewController.swift
//  ZeroNumber
//
//  Created by Yoochan Oh on 2020/10/07.
//  Copyright © 2020 Yoochan. All rights reserved.
//

import UIKit

class SendMessageViewController: UIViewController {
    
    var CarPlate:String? = "12가 3456"
    var QRData:String? = nil

    @IBOutlet weak var CarPlateLabel: UILabel!
    @IBOutlet weak var MessageField: UITextField!
    @IBOutlet weak var SendBT: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dismiss(animated: true, completion: nil)

        // Do any additional setup after loading the view.
        SendBT.layer.cornerRadius = 10.0
        SendBT.layer.masksToBounds = true
        
        CarPlateLabel.text = CarPlate
        
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.MessageField.resignFirstResponder()
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

            self.MessageField.resignFirstResponder()
            self.dismiss(animated: true, completion: nil)
            return true
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func SendButton(_ sender: Any) {
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompleteScreen") as? CompleteScreen else { return }
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(vc, animated: true)
    }
    
}
