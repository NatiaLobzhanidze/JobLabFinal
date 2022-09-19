//
//  VcSpinnerExtension.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 19.09.22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addBlurView (to mainView: UIView) -> UIView {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height:  Int(UIScreen.main.bounds.height)))
       // v.frame = mainView.frame
        v.backgroundColor = .white
        return v
    }
    func addIndicator(to view: UIView) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        view.addSubview(indicator)
        indicator.centerY(inView: view)
        indicator.centerX(inView: view)
        indicator.style = .large
        indicator.tintColor = .tintColor
        return indicator
    }
    func addSpiner(closure: () -> Void) {
        let blurView = addBlurView(to: self.view )
        self.view.addSubview(blurView)
        let indicator = addIndicator(to: blurView)
        indicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            indicator.stopAnimating()
        }
    }
  
//   lazy var indicator: UIActivityIndicatorView = {
//        let i = UIActaivityIndicatorView()
//       blurView.addSubview(i)
//        i.centerX(inView: blurView)
//        i.centerY(inView: blurView)
//        i.style = .large
//       i.tintColor = .tintColor
//       return i
//    }()
}

