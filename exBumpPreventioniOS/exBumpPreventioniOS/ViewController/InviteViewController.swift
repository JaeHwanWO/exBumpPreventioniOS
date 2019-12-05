//
//  InviteViewController.swift
//  exBumpPreventioniOS
//
//  Created by 조예진 on 2019/11/20.
//  Copyright © 2019 조예진. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController {
  
  @IBOutlet weak var codeTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func didTapOKButton(_ sender: Any) {
    ApiService.invite(myUUID:   UIDevice.current.identifierForVendor?.uuidString ?? "", randomCode: codeTextField.text ?? "")
    
  }
  
}
