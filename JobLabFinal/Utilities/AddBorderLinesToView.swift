//
//  AddBorderLinesToView.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 15.09.22.
//

import Foundation
import UIKit

extension UIView {
    enum ViewSide {
        case top
        case left
        case bottom
        case right
    }

    func addBorders(to sides: [ViewSide], in color: UIColor, width: CGFloat) {
        sides.forEach { addBorder(to: $0, in: color, width: width) }
    }

    func addBorder(to side: ViewSide, in color: UIColor, width: CGFloat) {
        switch side {
        case .top:
            addTopBorder(in: color, width: width)
        case .left:
            addLeftBorder(with: color, andWidth: width)
        case .bottom:
            addBottomBorder(in: color, width: width)
        case .right:
            addRightBorder(with: color, andWidth: width)
        }
    }
    func addLeftBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }

    func addRightBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
        addSubview(border)
    }
    func addTopBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        addSubview(border)
    }

    func addBottomBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        addSubview(border)
    }

// MARK: visual efect for indicator
        func showBlurLoader() {
            let blurLoader = BlurLoader(frame: frame)
            self.addSubview(blurLoader)
        }

        func removeBluerLoader() {
            if let blurLoader = subviews.first(where: { $0 is BlurLoader }) {
                blurLoader.removeFromSuperview()
            }
        }
    }

private class BlurLoader: UIView {

    var blurEffectView: UIVisualEffectView?

    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView = blurEffectView
        super.init(frame: frame)
        addSubview(blurEffectView)
        addLoader()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addLoader() {
        guard let blurEffectView = blurEffectView else { return }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        blurEffectView.contentView.addSubview(activityIndicator)
        activityIndicator.center = blurEffectView.contentView.center
        activityIndicator.startAnimating()
    }
}
