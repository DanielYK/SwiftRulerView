# SwiftRulerView


# 喜欢的朋友可以下载下来，如果您感觉代码对您有所帮助，还请在 github 给个 star，非常感谢您的支持！
 
 * swift版本的滑动标尺 , 之前用OC做了一个版本、最近在研究swift中的drawRect方法，刚好拿来练手，希望能给大家一点帮助。喜欢的可以给个Star ！
 

 * 使用方法 

<pre><code>
  lazy var lazyRulerView:DYScrollRulerView = { [unowned self] in
        let unitStr     = "¥"
        let rulerHeight = DYScrollRulerView.rulerViewHeight
        print(rulerHeight)
        var rulerView   = DYScrollRulerView.init(frame: CGRect.init(x: 5, y: Int(ScreenHeight)/5, width: Int(ScreenWidth)-20, height: rulerHeight()), tminValue: 0, tmaxValue: 1000, tstep: 10, tunit: unitStr, tNum:10)
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
       
        var timerView = DYScrollRulerView.init(frame: CGRect.init(x: 5, y: Int(ScreenHeight/5*3), width: Int(ScreenWidth)-20, height: rulersHeight()), tminValue: 0, tmaxValue: 23, tstep: 0.2, tunit: unitStr, tNum: 5)
        timerView.bgColor       = UIColor.orange
        timerView.triangleColor = UIColor.blue
        timerView.delegate      = self
        timerView.scrollByHand  = true
        return timerView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(lazyRulerView)
        self.view.addSubview(lazyTimeRullerView)
    }


</code></pre>

//滑动尺子时产生的回调

<pre><code>
extension ViewController:DYScorllRulerDelegate {
    func dyScrollRulerViewValueChange(rulerView: DYScrollRulerView, value: Float) {
        print("滑动的值-------》"+"\(value)")
    }
}
</code></pre>

 - 使用过程中有问题请加QQ或发邮件:584379066 备注：Git ScrollRuler


