//
//  QRReadViewController.swift
//  ZeroNumber
//
//  Created by Yoochan on 2020/09/28.
//  Copyright © 2020 Yoochan. All rights reserved.
//

import UIKit
import AVFoundation

class QRReadViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var square: UIImageView!
    var video = AVCaptureVideoPreviewLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Creating Session
        let session = AVCaptureSession()
        
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
         do
         {
              let input = try AVCaptureDeviceInput(device: captureDevice!)
              session.addInput(input)
         }
         catch
         {
              print("Error")
         }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubviewToFront(square)
        
        session.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr
                {
                    if(object.stringValue == "ZN001")
                    {
                        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SendMessageViewController") as? SendMessageViewController else { return }
                        
                        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                        
                        vc.QRData = object.stringValue
                        self.present(vc, animated: true)
                    }
                    else
                    {
                        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ErrorScreen") as? ErrorScreen else { return }
                        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                        self.present(vc, animated: true)
                    }
                }
            }
        }
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
