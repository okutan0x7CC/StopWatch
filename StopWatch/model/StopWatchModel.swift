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
    var startDate: Date!
    var hourField: NSTextField
    var minField: NSTextField
    var secField: NSTextField
    var isStarted: Bool
    
    init (hourField: NSTextField, minField: NSTextField, secField: NSTextField) {
        timer = Timer()
        self.hourField = hourField
        self.minField = minField
        self.secField = secField
        isStarted = false
        startDate = Date()
    }

    func Start() {
        startDate = Date()
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(update),
                                     userInfo: nil,
                                     repeats: true)
        isStarted = true
    }

    @objc private func update() {
        let now = Date()
        let (_, hour, min, sec) = calculateDifferenceTime(from: startDate, to: now)
        hourField.stringValue = NSString(format: "%02d", hour) as String
        minField.stringValue =  NSString(format: "%02d", min) as String
        secField.stringValue = NSString(format: "%02d", sec) as String
    }
    
    private func calculateDifferenceTime(from: Date, to: Date) -> (days: Int, hours: Int, minutes: Int, seconds: Int) {
        let calendar    = Calendar.current
        let s           = calendar.dateComponents([.second], from: from, to: to).second!
        let days        = Int(s / 86400)
        let hours       = Int((s - days * 86400) / 3600)
        let minutes     = Int(((s - days * 86400 - hours * 3600)) / 60)
        let seconds     = s - (minutes * 60) - (hours * 3600) - (days * 86400)
        return (days, hours, minutes, seconds)
    }

    func Stop() {
        timer.invalidate()
        isStarted = false
    }
    
    func Reset() {
        startDate = Date()
        hourField.stringValue = "00"
        minField.stringValue = "00"
        secField.stringValue = "00"
    }
}

