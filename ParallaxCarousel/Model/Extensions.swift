//
//  Utils.swift
//  ParallaxCarousel
//
//  Created by Maxim Macari on 4/12/20.
//

import SwiftUI

extension UIImage {
    //Dawnscaling image
    
    public func resize(width:CGFloat) -> UIImage? {
        let scale = width / self.size.width
        let height = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        self.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: width, height: height)))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
