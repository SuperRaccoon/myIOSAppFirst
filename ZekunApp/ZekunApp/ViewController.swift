//
//  ViewController.swift
//  ZekunApp
//
//  Created by Zekun Wang on 5/7/15.
//  Copyright (c) 2015 Zekun Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SpeedSlider: UISlider!;
    @IBOutlet weak var Satellite: UIImageView!;
    //var location = CGPointMake(0.0, 0.0);
    var speed: Float = 0.5;
    var radius: Float = 0.5;
    
    
    var lastUpdateTime = NSTimeInterval(0)
    var timeSinceLastAction = NSTimeInterval(0)
    var timeUntilNextAction = NSTimeInterval (1)
    
    /*
    override func update(currentTime: NSTimeInterval) {
        
        let delta = currentTime - lastUpdateTime
        lastUpdateTime  = currentTime
        
        timeSinceLastAction = delta
        
        if timeSinceLastAction >= timeUntilNextAction {
            
            let newX = calculateX(radius, speed)
            
            setPos(Satellite, XPos: , YPos: <#CGFloat#>)
        }
    }
    */
    
    
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        var speed = Float(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("setPos"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    /*
    func setPos(satObj: UIImageView, XPos: CGFloat, YPos: CGFloat) {
        satObj.center = CGPointMake(XPos, YPos)
    }
    */
    func setPos() {
        let XPos1 = calculateX(radius, speed: speed)
        let YPos1 = calculateY(radius, speed: speed)
        let XPos = CGFloat(XPos1)
        let YPos = CGFloat(YPos1)
        Satellite.center = CGPointMake(XPos, YPos)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateD(r:Float,speed: Float) -> Float {
        return (2 * 3.14 * r / speed)
    }
    
    func calculateX(r:Float, speed:Float) -> Float {
        let degrees = calculateD(r,speed:speed)
        return (r * cos(degrees))
    }
    func calculateY(r:Float, speed:Float) -> Float {
        let degrees=calculateD(r,speed:speed)
        return (r * sin(degrees))
    }


}

