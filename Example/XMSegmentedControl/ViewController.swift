//
//  ViewController.swift
//  XMSegmentedControl
//
//  Created by xaviermerino on 10/01/2015.
//  Copyright (c) 2015 Xavier Merino. All rights reserved.
//

import UIKit
import XMSegmentedControl

class ViewController: UIViewController, XMSegmentedControlDelegate {

    @IBOutlet weak var segmentedControl1: XMSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            Initialized from Storyboard
        */
        
        segmentedControl1.delegate = self
        segmentedControl1.segmentTitle = ["Hello", "World"]
        
        /*
            Examples created from code
            The segmented control can only display up to six elements. 
            It will ignore the excess.
        */
        
        // SegmentedControl2
        
        let backgroundColor = UIColor(red: 205/255, green: 74/255, blue: 1/255, alpha: 1)
        let highlightColor = UIColor(red: 226/255, green: 114/255, blue: 31/255, alpha: 1)
        
        let titles = ["Hello", "World", "Two"]
        let icons = [UIImage(named: "icon1")!, UIImage(named: "icon2")!, UIImage(named: "icon3")!]
        
        let frame = CGRect(x: 0, y: 114, width: self.view.frame.width, height: 44)
        
        let segmentedControl2 = XMSegmentedControl(frame: frame, segmentContent: (titles, icons), selectedItemHighlightStyle: XMSelectedItemHighlightStyle.bottomEdge)
        segmentedControl2.backgroundColor = backgroundColor
        segmentedControl2.highlightColor = highlightColor
        segmentedControl2.tint = UIColor.white
        segmentedControl2.highlightTint = UIColor.black
        segmentedControl2.disableItems = [0]
        
        let when = DispatchTime.now() + 3.0
        DispatchQueue.main.asyncAfter(deadline: when) {
            segmentedControl2.disableItems = [1]
        }
        
        self.view.addSubview(segmentedControl2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func xmSegmentedControl(_ xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        if xmSegmentedControl == segmentedControl1 {
            print("SegmentedControl1 Selected Segment: \(selectedSegment)")
        }
    }
}

