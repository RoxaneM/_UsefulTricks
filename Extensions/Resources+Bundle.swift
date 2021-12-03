//
//  Resources+Bundle.swift
//  _UsefulTricks
//
//  Created by Roksana Gud on 4/13/19.
//  Copyright © 2019 Roxane Markhyvka. All rights reserved.
//

import Foundation

// rox: loading image resources is happenning from Main bundle by default, so in order to load from framework bundle we need to specify that in init.
// Always make sure to use UIImage(named:) everywhere to load correct bundle (also watch out for image literals).
extension UIImage {
    convenience init?(named name: String) {
        let bundle = Bundle(identifier: "co.good.ios.GoodCoCore.UI") // you can get the name from General tab in Project Settings
        self.init(named: name, in: bundle, compatibleWith: nil)
    }
}

extension UIViewController {
    /// Convenient func to create UIViewController subclass from storyboard.
    /// Note: this func uses type name as an identifier string in storyboard file, so the two namings should match!
    /// E.g. class name `SomeViewController`, storyboard id `SomeViewController`
    public static func create<T: UIViewController>(_ vcClass: T.Type, from storyboardName: String) -> T {
        let bundle = Bundle(for: vcClass.self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        let identifier = String(describing: vcClass)

        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }

    /// Convenient func to create UIViewController subclass from xib.
    /// Note: this func uses type name as a .nib filename, so the two namings should match!
    /// E.g. class name `SomeViewController`, .nib name `SomeViewController`
    public static func createFromNib<T: UIViewController>(_ vcClass: T.Type) -> T {
        let bundle = Bundle(for: vcClass.self)
        let identifier = String(describing: vcClass)

        return T(nibName: identifier, bundle: bundle)
    }
}
