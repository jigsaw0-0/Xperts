
import Foundation
import UIKit
import SDWebImage

extension UIColor {
    
    fileprivate func components() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        guard let c = cgColor.components else { return (0, 0, 0, 1) }
        
        if cgColor.numberOfComponents == 2 {
            return (c[0], c[0], c[0], c[1])
        } else {
            return (c[0], c[1], c[2], c[3])
        }
    }
    
    static func interpolate(from: UIColor, to: UIColor, with fraction: CGFloat) -> UIColor {
        let f = min(1, max(0, fraction))
        let c1 = from.components()
        let c2 = to.components()
        let r = c1.0 + (c2.0 - c1.0) * f
        let g = c1.1 + (c2.1 - c1.1) * f
        let b = c1.2 + (c2.2 - c1.2) * f
        let a = c1.3 + (c2.3 - c1.3) * f
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    var redComponent: CGFloat {
        get {
            let components = self.cgColor.components
            if (components?.count)! > 0 {
                return components![0]
            }else{
                return 0
            }
        }
    }
    
    var greenComponent: CGFloat {
        get {
            let components = self.cgColor.components
            if (components?.count)! > 1 {
                return components![1]
            }else{
                return 0
            }
        }
    }
    
    var blueComponent: CGFloat {
        get {
            let components = self.cgColor.components
            if (components?.count)! > 2 {
            return components![2]
            }else{
                return 0
            }
        }
    }
    
    var alpha: CGFloat {
        get {
            return self.cgColor.alpha
        }
    }
    
    func alpha(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: self.redComponent, green: self.greenComponent, blue: self.blueComponent, alpha: alpha)
    }
    
    func whiteNew(_ scale: CGFloat) -> UIColor {
        return UIColor(
            red: self.redComponent + (1.0 - self.redComponent) * scale,
            green: self.greenComponent + (1.0 - self.greenComponent) * scale,
            blue: self.blueComponent + (1.0 - self.blueComponent) * scale,
            alpha: 1.0
        )
    }

    @nonobjc class var appBlack: UIColor {
      return UIColor(named: "AppBlack")!
    }
    
    @nonobjc class var appWhite: UIColor {
      return UIColor(named: "AppWhite")!
    }
    
    @nonobjc class var tabBGColorAndBorder: UIColor {
      return UIColor(named: "TabBGColorAndBorder")!
    }

    @nonobjc class var brightOrange: UIColor {
      return UIColor(named: "BrightOrange")!
    }
    
    @nonobjc class var cta: UIColor {
      return UIColor(named: "CTA")!
    }

    @nonobjc class var imagecanvasborder: UIColor {
      return UIColor(named: "ImageCanvasBorder")!
    }

    @nonobjc class var primaryFont: UIColor {
      return UIColor(named: "PrimaryFont")!
    }
  
    @nonobjc class var secondaryFont: UIColor {
      return UIColor(named: "SecondaryFont")!
    }

    @nonobjc class var activeFilterBG: UIColor {
      return UIColor(named: "ActiveFilterbg")!
    }

    @nonobjc class var enquireStatus: UIColor {
      return UIColor(named: "EnquireStatus")!
    }

    @nonobjc class var enquireStatus2: UIColor {
      return UIColor(named: "EnquireStatus2")!
    }

    @nonobjc class var onlyImageSliderCount: UIColor {
      return UIColor(named: "OnlyImagesSliderCount")!
    }

    @nonobjc class var buttonTextTopCategoriesBGcolor: UIColor {
      return UIColor(named: "ButtonTextTopCategoriesBGcolor")!
    }

    @nonobjc class var categoriesBG: UIColor {
      return UIColor(named: "CategoriesBG")!
    }
    // to be removed
    
    @nonobjc class var cerulean: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 118.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var gunmetal: UIColor {
        return UIColor(red: 65.0 / 255.0, green: 78.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var greyBlue: UIColor {
        return UIColor(red: 101.0 / 255.0, green: 120.0 / 255.0, blue: 141.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var charcoalGrey: UIColor {
        return UIColor(red: 54.0 / 255.0, green: 61.0 / 255.0, blue: 67.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var warmGrey: UIColor {
        return UIColor(white: 116.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var blueyGrey: UIColor {
        return UIColor(red: 168.0 / 255.0, green: 179.0 / 255.0, blue: 190.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var coolGrey: UIColor {
        return UIColor(red: 145.0 / 255.0, green: 151.0 / 255.0, blue: 163.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var paleRed: UIColor {
        return UIColor(red: 218.0 / 255.0, green: 79.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var whiteTwo: UIColor {
        return UIColor(red: 246.0 / 255.0, green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var brightBlue: UIColor {
        return UIColor(red: 0.0, green: 122.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var bluishGrey: UIColor {
        return UIColor(red: 120.0 / 255.0, green: 136.0 / 255.0, blue: 152.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var darkGrassGreen: UIColor {
        return UIColor(red: 37.0 / 255.0, green: 144.0 / 255.0, blue: 4.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var paleGrey: UIColor {
        return UIColor(red: 228.0 / 255.0, green: 234.0 / 255.0, blue: 239.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var steel: UIColor {
        return UIColor(red: 120.0 / 255.0, green: 135.0 / 255.0, blue: 152.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var veryLightPink: UIColor {
        return UIColor(red: 229 / 255.0, green: 229 / 255.0, blue: 229 / 255.0, alpha: 1.0)
    }
    @nonobjc class var paleSkyBlue: UIColor {
        return UIColor(red: 201 / 255.0, green: 224 / 255.0, blue: 242 / 255.0, alpha: 1.0)
    }
    @nonobjc class var niceBlue: UIColor {
        return UIColor(red: 18 / 255.0, green: 116 / 255.0, blue: 192 / 255.0, alpha: 1.0)
    }
    @nonobjc class var darkGrey2: UIColor {
        return UIColor(red: 26 / 255.0, green: 27 / 255.0, blue: 29 / 255.0, alpha: 1.0)
    }
    @nonobjc class var iceBlue: UIColor {
        return UIColor(red: 238 / 255.0, green: 241 / 255.0, blue: 243 / 255.0, alpha: 1.0)
    }

}

