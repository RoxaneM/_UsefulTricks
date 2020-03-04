//
//  UITable-CollectionView+Reuse.swift
//  GCCoreUI
//
//  Created by Roxane Gud on 11/12/19.
//  Copyright © 2019 Roxane Markhyvka. All rights reserved.
//

import Foundation

extension UITableView {
    /// Convenient func to register UITableViewCell subclass by it's type.
    /// Note: this func uses type name as a nib file name string and reuseIdentifier string, so all three namings should match!
    /// E.g. class name `SomeTableViewCell`, nib name `SomeTableViewCell.xib`, reuse identifier string `SomeTableViewCell`
    public func register(_ cellClass: UITableViewCell.Type) {
        let className = String(describing: cellClass)
        let nib = UINib(nibName: className, bundle: Bundle(for: cellClass.self))

        register(nib, forCellReuseIdentifier: className)
    }

    /// Convenient func to dequeue UITableViewCell subclass by it's type.
    /// Note: this func uses type name as a  reuseIdentifier string, so both namings should match!
    /// E.g. class name `SomeTableViewCell`, reuse identifier string `SomeTableViewCell`
    public func dequeue<T: UITableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T? {
        let identifier = String(describing: cellClass)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
    }
}

extension UICollectionView {
    /// Convenient func to register UICollectionViewCell subclass by it's type.
    /// Note: this func uses type name as a nib file name string and reuseIdentifier string, so all three namings should match!
    /// E.g. class name `SomeCollectionViewCell`, nib name `SomeCollectionViewCell.xib`, reuse identifier string `SomeCollectionViewCell`
    public func register(_ cellClass: UICollectionViewCell.Type) {
        let className = String(describing: cellClass)
        let nib = UINib(nibName: className, bundle: Bundle(for: cellClass.self))

        register(nib, forCellWithReuseIdentifier: className)
    }

    /// Convenient func to dequeue UICollectionViewCell subclass by it's type.
    /// Note: this func uses type name as a  reuseIdentifier string, so both namings should match!
    /// E.g. class name `SomeCollectionViewCell`, reuse identifier string `SomeCollectionViewCell`
    public func dequeue<T: UICollectionViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T? {
        let identifier = String(describing: cellClass)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
    }
}
