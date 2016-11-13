//
//  LogInViewController.swift
//  GTHC
//
//  Created by Ryan Bergamini on 11/12/16.
//  Copyright © 2016 Duke Innovation CoLab. All rights reserved.
//

import Foundation
import UIKit

class LogInViewController : UIViewController
{
    
    @IBOutlet weak var logInButton: UIButton!
  
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    var backgroundImageFileName: String = "dog"
   
    @IBAction func triggerSignInWithGoogle(_ sender: Any) {
        print("Logging in...")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backgroundImage.image = UIImage(named:backgroundImageFileName)!
    }
}
