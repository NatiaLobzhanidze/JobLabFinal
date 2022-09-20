//
//  ImageViewExtension.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 09.09.22.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIImageView {
  func loadImageUsingCache(withUrl urlString : String) {
    let imageCache = NSCache<NSString, UIImage>()
    let url = URL(string: urlString)
    if url == nil { return }
    self.image = nil
    // check cached image
    if let cachedImage = imageCache.object(forKey: urlString as NSString) {
      self.image = cachedImage
      return
    }
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.medium)
    addSubview(activityIndicator)
    activityIndicator.startAnimating()
    activityIndicator.center = self.center
    // if not, download image from url
    URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
      if error != nil {
        print(error!)
        return
      }
      DispatchQueue.main.async {
        if let image = UIImage(data: data!) {
          imageCache.setObject(image, forKey: urlString as NSString)
          self.image = image
          activityIndicator.removeFromSuperview()
        }
      }
    }).resume()
  }
}
