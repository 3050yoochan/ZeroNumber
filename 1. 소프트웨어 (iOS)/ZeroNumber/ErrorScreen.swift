//
//  ErrorScreen.swift
//  ZeroNumber
//
//  Created by Yoochan Oh on 2020/10/07.
//  Copyright © 2020 Yoochan. All rights reserved.
//

import UIKit

class ErrorScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
            
            vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            
            self.present(vc, animated: true)
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
