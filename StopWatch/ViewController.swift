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
    @IBOutlet weak var buttonField: NSTextField!
    var stopWatch: StopWatchModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatch = StopWatchModel(hourField: hourField,
                                   minField: minField,
                                   secField: secField)
        
        
    }

    @IBAction func tapStartButton(_ sender: Any) {
        if !stopWatch.isStarted {
            stopWatch.Start()
            buttonField.stringValue = "stop"
        } else {
            stopWatch.Stop()
            buttonField.stringValue = "start"
        }
    }
    
    @IBAction func tapResetButton(_ sender: Any) {
        stopWatch.Reset()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
}

