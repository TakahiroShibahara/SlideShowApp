//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 柴原 隆宏 on 2018/11/21.
//  Copyright © 2018 takahiro.shibahara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet weak var imageView: UIButton!

  let img:[String] = ["gigantes.jpg","killer.jpg","hagon.jpg","zoma.jpg"]
  var index = 0
  var timer_sec: Float = 0
  var timer: Timer!
  
  func timerCounter() {
    if index <= 3 {
      index += 1
    }else{
      index = 0
    }
  }

  @IBOutlet weak var forward: UIButton!
  @IBAction func forward(_ sender: Any) {
    index += 1
    displayImageForward()
  }
  func displayImageForward(){
    if index > 3 {
      index = 0
    }
    imageView.setImage(UIImage(named: img[index]), for: .normal)
  }

  @IBOutlet weak var back: UIButton!
  @IBAction func back(_ sender: Any) {
    index -= 1
    displayImageBack()
  }
  func displayImageBack(){
    if index < 0 {
      index = 3
    }
    imageView.setImage(UIImage(named: img[index]), for: .normal)
  }

  @objc func updateTimer(_ timer: Timer) {
    index += 1
    displayImageForward()
  }

  @IBOutlet weak var btnPlayPause: UIButton!
  @IBAction func btnPlayPause(_ sender: Any) {

    if timer == nil {
      self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
      btnPlayPause.setTitle("停止", for :.normal)
      forward.isEnabled = false
      back.isEnabled = false

    }else {
      timer!.invalidate()
      timer = nil
      btnPlayPause.setTitle("再生", for :.normal)
      forward.isEnabled = true
      back.isEnabled = true
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if timer !== nil {
      timer!.invalidate()
      timer = nil
    }
    btnPlayPause.setTitle("再生", for :.normal)
    forward.isEnabled = true
    back.isEnabled = true
    let resultViewController:ResultViewController = segue.destination as! ResultViewController

    resultViewController.largeImage = UIImage(named: img[index])
  }


  @IBAction func unwind(_ segue: UIStoryboardSegue) {
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}





