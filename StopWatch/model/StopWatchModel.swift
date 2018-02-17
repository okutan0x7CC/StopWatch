//
//  StopWatchModel.swift
//  StopWatch
//
//  Created by MasakiOkuno on 2018/02/17.
//  Copyright © 2018年 mycompany. All rights reserved.
//

import Cocoa

class StopWatchModel {
    
    var timer: Timer
    var counter: Int
    var hourField: NSTextField!
    var minField: NSTextField!
    var secField: NSTextField!
    
    init (hourField: NSTextField, minField: NSTextField, secField: NSTextField) {
        timer = Timer()
        counter = 0
        self.hourField = hourField
        self.minField = minField
        self.secField = secField
    }

    func Start() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(update),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc private func update() {
        counter += 1
        let hour = Int(counter / 3600)
        let min  = Int((counter - hour * 3600) / 60)
        let sec  = counter - hour * 3600 - min * 60
        hourField.stringValue = NSString(format: "%02d", hour) as String
        minField.stringValue =  NSString(format: "%02d", min) as String
        secField.stringValue = NSString(format: "%02d", sec) as String
    }

    func Stop() {
        timer.invalidate()
    }
    
    func Reset() {
        counter = 0
        hourField.stringValue = "00"
        minField.stringValue = "00"
        secField.stringValue = "00"
    }
}

