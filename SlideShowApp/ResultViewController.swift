//
//  ResultViewController.swift
//  SlideShowApp
//
//  Created by 柴原 隆宏 on 2018/11/21.
//  Copyright © 2018 takahiro.shibahara. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  
  var largeImage : UIImage!

  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.image = largeImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  

}
