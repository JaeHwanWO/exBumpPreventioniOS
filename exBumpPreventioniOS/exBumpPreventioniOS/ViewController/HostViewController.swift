//
//  HostViewController.swift
//  exBumpPreventioniOS
//
//  Created by 조예진 on 2019/11/20.
//  Copyright © 2019 조예진. All rights reserved.
//

import UIKit

class HostViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    codeTextField.delegate = self
  }
  @IBOutlet weak var codeTextField: UITextField!
  
  @IBAction func didTapHostButton(_ sender: Any) {
    ApiService.host(myUUID: UIDevice.current.identifierForVendor?.uuidString ?? "", callback: { (response) in
      print(response)
      self.codeTextField.text = response
    })
  }
  
}

extension HostViewController: UITextFieldDelegate {
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
