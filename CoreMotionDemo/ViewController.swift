//
//  ViewController.swift
//  CoreMotionDemo
//
//  Created by Sunny NG on 25/2/2017.
//  Copyright © 2017 Sunny NG. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {

    var motionManager: CMMotionManager!
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.motionManager = CMMotionManager()
        self.motionManager.accelerometerUpdateInterval = 0.1
        
        if motionManager.isAccelerometerAvailable {
            print("acceleromet is available")
            motionManager.startAccelerometerUpdates(to: OperationQueue.main,
                withHandler: { (accelerometerData, error) -> Void in
                    if error != nil {
                        self.motionManager.stopAccelerometerUpdates()
                    } else {
                        self.xLabel.text = String(format: "%f", (accelerometerData?.acceleration.x)!)
                        self.yLabel.text = String(format: "%f", (accelerometerData?.acceleration.y)!)
                        self.zLabel.text = String(format: "%f", (accelerometerData?.acceleration.z)!)
                    }
                }
            )
            
        }
        else {
            print("acceleromet is not available")

        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.motionManager.stopAccelerometerUpdates()
    }


}

