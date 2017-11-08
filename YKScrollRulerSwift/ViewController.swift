//
//  ViewController.swift
//  YKScrollRulerSwift
//
//  Created by Daniel Yao on 16/11/22.
//  Copyright © 2016年 Daniel Yao. All rights reserved.
//

import UIKit
// 屏幕宽度
let ScreenWidth = UIScreen.main.bounds.width
// 屏幕高度
let ScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    
    lazy var lazyRulerView:DYScrollRulerView = { [unowned self] in
        let unitStr     = "¥"
        let rulerHeight = DYScrollRulerView.rulerViewHeight
        print(rulerHeight)
        var rulerView   = DYScrollRulerView.init(frame: CGRect.init(x: 5, y: Int(ScreenHeight/5*0.5), width: Int(ScreenWidth)-20, height: rulerHeight()), tminValue: 0, tmaxValue: 1000, tstep: 10, tunit: unitStr, tNum:10, viewcontroller:self)
        rulerView.setDefaultValueAndAnimated(defaultValue: 500, animated: true)
        rulerView.bgColor       = UIColor.cyan
        rulerView.triangleColor = UIColor.red
        rulerView.delegate      = self
        rulerView.scrollByHand  = true
       return rulerView
    }()
    
    lazy var lazyTimeRullerView:DYScrollRulerView = { [unowned self] in
        let unitStr = ""
        let rulersHeight = DYScrollRulerView.rulerViewHeight
        print(rulersHeight)
       
        var timerView = DYScrollRulerView.init(frame: CGRect.init(x: 5, y: Int(ScreenHeight/5*2), width: Int(ScreenWidth)-20, height: rulersHeight()), tminValue: 0, tmaxValue: 23, tstep: 0.2, tunit: unitStr, tNum: 5, viewcontroller:self)
        timerView.setDefaultValueAndAnimated(defaultValue: 2, animated: true)
        timerView.bgColor       = UIColor.orange
        timerView.triangleColor = UIColor.blue
        timerView.delegate      = self
        timerView.scrollByHand  = true
        return timerView
    }()
    
    lazy var lazyNoneZeroRullerView:DYScrollRulerView = { [unowned self] in
        let unitStr = ""
        let rulersHeight = DYScrollRulerView.rulerViewHeight
        print(rulersHeight)
        
        var zeroRulerView = DYScrollRulerView.init(frame: CGRect.init(x: 5, y: Int(ScreenHeight/5*3.5), width: Int(ScreenWidth)-20, height: rulersHeight()), tminValue: 20, tmaxValue: 200, tstep: 1, tunit: unitStr, tNum: 5, viewcontroller:self)
        zeroRulerView.setDefaultValueAndAnimated(defaultValue: 50, animated: true)
        zeroRulerView.bgColor       = UIColor.orange
        zeroRulerView.triangleColor = UIColor.blue
        zeroRulerView.delegate      = self
        zeroRulerView.scrollByHand  = true
        return zeroRulerView
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(lazyRulerView)
        self.view.addSubview(lazyTimeRullerView)
        self.view.addSubview(lazyNoneZeroRullerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
extension ViewController:DYScrollRulerDelegate {
    func dyScrollRulerViewValueChange(rulerView: DYScrollRulerView, value: Float) {
        print("滑动的值-------》"+"\(value)")
    }
}
