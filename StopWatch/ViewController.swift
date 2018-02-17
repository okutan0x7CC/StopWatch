//
//  ViewController.swift
//  Timer
//
//  Created by MasakiOkuno on 2018/02/17.
//  Copyright © 2018年 mycompany. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var hourField: NSTextField!
    @IBOutlet weak var minField: NSTextField!
    @IBOutlet weak var secField: NSTextField!
    @IBOutlet weak var buttonField: NSTextFieldCell!
    var stopWatch: StopWatchModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatch = StopWatchModel(hourField: hourField, minField: minField, secField: secField)
    }

    @IBAction func tapButton(_ sender: Any) {
        if buttonField.stringValue != "stop" {
            stopWatch.Start()
            buttonField.stringValue = "stop"
        } else {
            stopWatch.Stop()
            stopWatch.Reset()
            buttonField.stringValue = "start"
        }
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
}

