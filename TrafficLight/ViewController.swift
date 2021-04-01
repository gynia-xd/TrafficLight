//
//  ViewController.swift
//  TrafficLight
//
//  Created by Пётр  on 01.04.2021.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!

    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let LightIsON: CGFloat = 10
    private let LightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redLight.alpha = LightIsOff
        yellowLight.alpha = LightIsOff
        greenLight.alpha = LightIsOff
          
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
         
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
    }
    
    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "Start" {
            startButton.setTitle("NEXT", for: .normal)
            }
        switch currentLight {
        case .red:
            greenLight.alpha = LightIsOff
            redLight.alpha = LightIsON
            currentLight = .yellow
        case .yellow:
            redLight.alpha = LightIsOff
            yellowLight.alpha = LightIsON
            currentLight = .green
        case .green:
            greenLight.alpha = LightIsON
            yellowLight.alpha = LightIsOff
            currentLight = .red
        }
        
    }
    

}

