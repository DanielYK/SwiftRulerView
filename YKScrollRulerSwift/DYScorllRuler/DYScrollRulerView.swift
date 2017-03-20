//
//  DYScrollRulerView.swift
//  YKScrollRulerSwift
//
//  Created by Daniel Yao on 16/11/22.
//  Copyright © 2016年 Daniel Yao. All rights reserved.
//

import UIKit

fileprivate let TextRulerFont    = UIFont.systemFont(ofSize: 11)
fileprivate let RulerLineColor   = UIColor.gray
fileprivate let RulerGap         = 12
fileprivate let RulerLong        = 40
fileprivate let RulerShort       = 30
fileprivate let TriangleWidth    = 16
fileprivate let CollectionHeight = 70
fileprivate let TextColorWhiteAlpha:CGFloat = 1.0


/***************DY************分************割************线***********/

class DYTriangleView: UIView {
    
    var triangleColor:UIColor?
    
    override func draw(_ rect: CGRect) {
        UIColor.clear.set()
        UIRectFill(self.bounds)
        
        let context = UIGraphicsGetCurrentContext()
        
        context!.beginPath()
        context!.move(to: CGPoint.init(x: 0, y: 0))
        context!.addLine(to: CGPoint.init(x: TriangleWidth, y: 0))
        context!.addLine(to: CGPoint.init(x: TriangleWidth/2, y: TriangleWidth/2))
        context!.setLineCap(CGLineCap.butt)
        context!.setLineJoin(CGLineJoin.bevel)
        context!.closePath()
        
        triangleColor?.setFill()
        triangleColor?.setStroke()
        
        context!.drawPath(using: CGPathDrawingMode.fillStroke)
    }
    
}

/***************DY************分************割************线***********/

class DYRulerView: UIView {
    var minValue:Float = 0.0
    var maxValue:Float = 0.0
    var unit:String = ""
    var step:Float = 0.0
    var betweenNumber = 0
    override func draw(_ rect: CGRect) {
        let startX:CGFloat  = 0
        let lineCenterX     = CGFloat(RulerGap)
        let shortLineY      = rect.size.height - CGFloat(RulerLong)
        let longLineY       = rect.size.height - CGFloat(RulerShort)
        let topY:CGFloat    = 0
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1)
        context?.setLineCap(CGLineCap.butt)
        context?.setStrokeColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        for i in 0...betweenNumber {
            print(i)
            context?.move(to: CGPoint.init(x: startX+lineCenterX*CGFloat(i), y: topY))
            if i%betweenNumber == 0 {
                let num = Float(i)*step+minValue
                print(unit)
                var numStr = String(format: "%.f%@", num,unit)
                if num > 1000000 {
                    numStr = String(format: "%f万%@", num/10000,unit)
                }
                print(i,step,minValue)
                let attribute:Dictionary = [NSFontAttributeName:TextRulerFont,NSForegroundColorAttributeName:UIColor.init(white: TextColorWhiteAlpha, alpha: 1.0)]
                
                let width = numStr.boundingRect(
                    with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude),
                    options: NSStringDrawingOptions.usesLineFragmentOrigin,
                    attributes: attribute,context: nil).size.width
                numStr.draw(in: CGRect.init(x: startX+lineCenterX*CGFloat(i)-width/2, y: longLineY+10, width: width, height: 14), withAttributes: attribute)
                context!.addLine(to: CGPoint.init(x: startX+lineCenterX*CGFloat(i), y: longLineY))
            }else{
                context!.addLine(to: CGPoint.init(x: startX+lineCenterX*CGFloat(i), y: shortLineY))
            }
            context!.strokePath()

        }
        
    }
}

/***************DY************分************割************线***********/

class DYHeaderRulerView: UIView {
    
    var headerMinValue = 0
    var headerUnit = ""
    
    override func draw(_ rect: CGRect) {
        let longLineY = rect.size.height - CGFloat(RulerShort)
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        context?.setLineWidth(1.0)
        context?.setLineCap(CGLineCap.butt)
        
        context?.move(to: CGPoint.init(x: rect.size.width, y: 0))
        var numStr:NSString = NSString(format: "%d%@", headerMinValue,headerUnit)
        if headerMinValue > 1000000 {
            numStr = NSString(format: "%f万%@", headerMinValue/10000,headerUnit)
        }
        let attribute:Dictionary = [NSFontAttributeName:TextRulerFont,NSForegroundColorAttributeName:UIColor.init(white: TextColorWhiteAlpha, alpha: 1.0)]
        let width = numStr.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions(rawValue: 0), attributes: attribute, context: nil).size.width
        numStr.draw(in: CGRect.init(x: rect.size.width-width/2, y: longLineY+10, width: width, height: 14), withAttributes: attribute)
        context?.addLine(to: CGPoint.init(x: rect.size.width, y: longLineY))
        context?.strokePath()
        
    }
}

/***************DY************分************割************线***********/

class DYFooterRulerView: UIView {
    var footerMaxValue = 0
    var footerUnit = ""
    
    override func draw(_ rect: CGRect) {
        let longLineY = Int(rect.size.height) - RulerShort
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        context?.setLineWidth(1.0)
        context?.setLineCap(CGLineCap.butt)
        
        context?.move(to: CGPoint.init(x: 0, y: 0))
        var numStr:NSString = NSString(format: "%d%@", footerMaxValue,footerUnit)
        if footerMaxValue > 1000000 {
            numStr = NSString(format: "%f万%@", footerMaxValue/10000,footerUnit)
        }
        let attribute:Dictionary = [NSFontAttributeName:TextRulerFont,NSForegroundColorAttributeName:UIColor.init(white: TextColorWhiteAlpha, alpha: 1.0)]
        let width = numStr.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions(rawValue: 0), attributes: attribute, context: nil).size.width
        numStr.draw(in: CGRect.init(x: 0-width/2, y: CGFloat(longLineY+10), width: width, height:CGFloat(14)), withAttributes: attribute)
        context?.addLine(to: CGPoint.init(x: 0, y: longLineY))
        context?.strokePath()
    }
}

/***************DY************分************割************线***********/

protocol DYScorllRulerDelegate:NSObjectProtocol {
    func dyScrollRulerViewValueChange(rulerView:DYScrollRulerView,value:Float)
}
class DYScrollRulerView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    weak var delegate:DYScorllRulerDelegate?
    
    var scrollByHand = true
    var triangleColor:UIColor? = nil
    var bgColor:UIColor? = nil
    var stepNum = 0//分多少个大区

    private var redLine:UIImageView?
    private var fileRealValue:Float = 0.0
    var rulerUnit:String = ""
    var minValue:Float = 0.0
    var maxValue:Float = 0.0
    var step:Float = 0.0 //间隔值，每两条相隔多少值
    var betweenNum:Int = 0
    
    
    class func rulerViewHeight() -> Int {
        return 40+20+CollectionHeight
    }
    
    init(frame: CGRect,tminValue:Float,tmaxValue:Float,tstep:Float,tunit:String,tNum:Int) {
        super.init(frame: frame)
        minValue    = tminValue
        maxValue    = tmaxValue
        betweenNum  = tNum
        step        = tstep
        stepNum     = Int((tmaxValue - tminValue)/step)/betweenNum
        rulerUnit   = tunit
        bgColor     = UIColor.white

        triangleColor = UIColor.orange
        self.backgroundColor    = UIColor.white
        
        lazyValueTF.frame       = CGRect.init(x: self.bounds.size.width/2-60, y: 10, width: 80, height: 40)
        self.addSubview(self.lazyValueTF)

        lazyTriangle.frame      = CGRect.init(x: self.bounds.size.width/2-0.5 - CGFloat(TriangleWidth)/2, y: lazyValueTF.frame.maxY, width: CGFloat(TriangleWidth), height: CGFloat(TriangleWidth))
        
        self.addSubview(self.lazyUnitLab)
        self.addSubview(self.lazyCollectionView)
        self.addSubview(self.lazyTriangle)

        self.lazyCollectionView.frame = CGRect.init(x: 0, y:self.lazyValueTF.frame.maxY, width: self.bounds.size.width, height: CGFloat(CollectionHeight))
        self.lazyUnitLab.text = tunit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var lazyValueTF: UITextField = {[unowned self] in
        let zyValueTF = UITextField()
        zyValueTF.isUserInteractionEnabled  = true
        zyValueTF.defaultTextAttributes     = [NSFontAttributeName:UIFont.systemFont(ofSize: 19)]
        zyValueTF.textAlignment = NSTextAlignment.right
        zyValueTF.delegate      = self
        zyValueTF.keyboardType  = UIKeyboardType.phonePad
        
        return zyValueTF
    }()
    lazy var lazyUnitLab: UILabel = {
        let zyUnitLab = UILabel()
        zyUnitLab.textColor = UIColor.red
        
        return zyUnitLab
    }()
    lazy var lazyCollectionView: UICollectionView = {[unowned self]in
        
        let flowLayout              = UICollectionViewFlowLayout()
        flowLayout.scrollDirection  = UICollectionViewScrollDirection.horizontal
        flowLayout.sectionInset     = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        let zyCollectionView:UICollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.bounds.size.width, height: CGFloat(CollectionHeight)), collectionViewLayout: flowLayout)
        zyCollectionView.backgroundColor    = UIColor.red
        zyCollectionView.bounces            = true
        zyCollectionView.showsHorizontalScrollIndicator = false
        zyCollectionView.showsVerticalScrollIndicator   = false
        zyCollectionView.delegate   = self
        zyCollectionView.dataSource = self
        zyCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "headCell")
        zyCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "footerCell")
        zyCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "customeCell")

        return zyCollectionView
    }()
    lazy var lazyTriangle: DYTriangleView = {
        let triangleView = DYTriangleView()
        triangleView.backgroundColor = UIColor.clear
        triangleView.triangleColor = UIColor.blue
        return triangleView
    }()
    
    @objc fileprivate func didChangeCollectionValue() {
        let textFieldValue = Float(lazyValueTF.text!)
        if (textFieldValue!-minValue)>=0 {
            self.setRealValueAndAnimated(realValue: (textFieldValue!-minValue)/step, animated: true)
        }
    }
    
    @objc fileprivate func setRealValueAndAnimated(realValue:Float,animated:Bool){
        fileRealValue       = realValue
        lazyValueTF.text    = String.init(format: "%.1f", fileRealValue*step+minValue)
        lazyCollectionView.setContentOffset(CGPoint.init(x: Int(realValue)*RulerGap, y: 0), animated: animated)
    }

}

extension DYScrollRulerView:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2+stepNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell:UICollectionViewCell       = collectionView.dequeueReusableCell(withReuseIdentifier: "headCell", for: indexPath)
            var headerView:DYHeaderRulerView?   = cell.contentView.viewWithTag(1000) as?DYHeaderRulerView
            
            if headerView == nil{
                headerView = DYHeaderRulerView.init(frame: CGRect.init(x: 0, y: 0, width: Int(self.frame.size.width/2), height: CollectionHeight))
                headerView!.backgroundColor  = UIColor.clear
                headerView!.headerMinValue   = Int(minValue)
                headerView!.headerUnit       = rulerUnit
                headerView!.tag              = 1000
                cell.contentView.addSubview(headerView!)
            }
            return cell
        }else if indexPath.item == stepNum+1 {
            let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "footerCell", for: indexPath)
            var footerView:DYFooterRulerView? = cell.contentView.viewWithTag(1001) as? DYFooterRulerView
            if footerView == nil {
                footerView = DYFooterRulerView.init(frame: CGRect.init(x: 0, y: 0, width: Int(self.frame.size.width/2), height: CollectionHeight))
                footerView!.backgroundColor  = UIColor.clear
                footerView!.footerMaxValue   = Int(maxValue)
                footerView!.footerUnit       = rulerUnit
                footerView!.tag              = 1001
                cell.contentView.addSubview(footerView!)
            }
            return cell
        }else{
            let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "customeCell", for: indexPath)
            var rulerView:DYRulerView? = cell.contentView.viewWithTag(1002) as? DYRulerView
            if rulerView == nil {
                rulerView = DYRulerView.init(frame: CGRect.init(x: 0, y: 0, width: RulerGap*betweenNum, height: CollectionHeight))
                rulerView!.backgroundColor   = UIColor.clear
                rulerView!.step              = step
                rulerView!.unit              = rulerUnit
                rulerView!.tag               = 1002
                rulerView!.betweenNumber     = betweenNum;
                cell.contentView.addSubview(rulerView!)
            }
            rulerView!.minValue = step*Float((indexPath.item-1))*Float(betweenNum)
            rulerView!.maxValue = step*Float(indexPath.item)*Float(betweenNum)
            rulerView!.setNeedsDisplay()
 
            return cell
        }
        
    }
    
    
}
extension DYScrollRulerView:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = Int(scrollView.contentOffset.x)/RulerGap
        let totalValue = Float(value)*step+minValue
        if scrollByHand {
            if totalValue>=maxValue {
                lazyValueTF.text = String.init(format: "%.1f", maxValue)
            }else if totalValue <= minValue {
                lazyValueTF.text = String.init(format: "%.1f", minValue)
            }else{
                lazyValueTF.text = String.init(format: "%.1f", Float(value)*step+minValue)
            }
        }
        delegate?.dyScrollRulerViewValueChange(rulerView: self, value: totalValue)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.setRealValueAndAnimated(realValue: Float(scrollView.contentOffset.x)/Float(RulerGap), animated: true)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.setRealValueAndAnimated(realValue: Float(scrollView.contentOffset.x)/Float(RulerGap), animated: true)
    }
}
extension DYScrollRulerView:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 || indexPath.item == stepNum + 1 {
            return CGSize(width: Int(self.frame.size.width/2), height: CollectionHeight)
        }
        return CGSize(width: RulerGap*betweenNum, height: CollectionHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension DYScrollRulerView:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let newStr:NSString = (currentText as NSString).replacingCharacters(in: range, with: string) as NSString
        if newStr.floatValue > maxValue{
            lazyValueTF.text = String.init(format: ".f", maxValue)
            self.perform(#selector(self.didChangeCollectionValue), with: nil, afterDelay: 0)
        }else{
            NSObject.cancelPreviousPerformRequests(withTarget: self)
            self.perform(#selector(self.didChangeCollectionValue), with: nil, afterDelay: 1)
        }
        
        return true
    }
}


