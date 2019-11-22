//
//  MainViewController.swift
//  exBumpPreventioniOS
//
//  Created by 조예진 on 2019/11/20.
//  Copyright © 2019 조예진. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  @IBOutlet weak var testButton: UIButton!
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func didTapTestButton(_ sender: Any) {
    print("mainbutton call")
    ApiService.updateGPS(myUUID: "yejinCho", latitude: 123.123, longitude: 124.124)
  }

}
