//
//  PageConentViewController.swift
//  GTHC
//
//  Created by Ryan Bergamini on 11/12/16.
//  Copyright © 2016 Duke Innovation CoLab. All rights reserved.
//

import Foundation
import UIKit

class PageContentViewController : UIViewController
{
   
    @IBOutlet weak var textContent: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    var pageIndex: Int = -1
    var backgroundImage: UIImage? = nil
    var messageContent: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backgroundImageView.image = backgroundImage!;
        textContent.text = messageContent;
    }
}
