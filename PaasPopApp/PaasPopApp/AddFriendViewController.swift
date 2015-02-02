//
//  AddFriendViewController.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 29-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit
import AVFoundation
import RSBarcodes

class AddFriendViewController: RSCodeReaderViewController {

    var friends: [Person]?
    let captureSession = AVCaptureSession()
    var captureDevice: AVCaptureDevice?
    var previewLayer : AVCaptureVideoPreviewLayer?
    @IBOutlet var emptyView: UIView!
    
    @IBAction func addFriendAction(sender: UIBarButtonItem) {
        var f: [Person] = getFriends()
        f.append(Person(nameInput: textFieldName.text))
        setFriends(f)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func getFriends() -> [Person] {
        if friends == nil {
            if let storedData = NSUserDefaults.standardUserDefaults().objectForKey("friends") as? NSData {
                friends = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as [Person]?
            } else {
                friends = [Person]()
            }
        }
        return friends!
    }
    
    func setFriends(newFriends: [Person]) {
        println("setFriends")
        for friend in newFriends {
            println("\(friend.name)")
        }
        let data = NSKeyedArchiver.archivedDataWithRootObject(newFriends)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "friends")
    }
    
    @IBOutlet var textFieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.focusMarkLayer.strokeColor = UIColor.redColor().CGColor
        
        self.cornersLayer.strokeColor = UIColor.yellowColor().CGColor
        
        self.tapHandler = { point in
            println(point)
        }
        
        self.barcodesHandler = { barcodes in
            for barcode in barcodes {
                println(barcode)
            }
        }
        
        captureSession.sessionPreset = AVCaptureSessionPresetLow
        let devices = AVCaptureDevice.devices()
        println(devices)
        
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                // Finally check the position and confirm we've got the back camera
                if(device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as? AVCaptureDevice
                }
            }
        }
        
        if captureDevice != nil {
            beginSession()
        }
    }
    
    func beginSession() {
        var err : NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
        
        if err != nil {
            println("error: \(err?.localizedDescription)")
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.addSublayer(previewLayer)
        previewLayer?.frame = emptyView.layer.frame
        captureSession.startRunning()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
