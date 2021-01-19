//
//  Array+Extension.swift
//  _UsefulTricks
//
//  Created by Roksana Gud on 2/22/19.
//  Copyright © 2019 Roxane Markhyvka. All rights reserved.
//

import Foundation

public extension Array {

    /// Method which is used to check whether index is whithin bounds.
    ///
    /// - Parameters:
    ///   - index: the Integer index to check whether it is whithin bounds.
    /// - Returns:
    ///   - `true` if index is within the bounds and `false` otherwise.
    func isSafe(_ index: Int) -> Bool {
        guard !self.isEmpty else { return false }

        return index >= 0 && index < self.count
    }

    /// Method which is used to safely get an element from array at index. Returns nil if the index is out of bounds.
    ///
    /// - Parameters:
    ///   - index: the Integer index of element to get from array.
    /// - Returns:
    ///   - array's element at given index, or nil in case the index is out of bounds.
    func get(at index: Int) -> Element? {
        return isSafe(index) ? self[index] : nil
    }

    /// Method which is used to get random elements from array of given count.
    ///
    /// - Parameters:
    ///   - count: the Integer count of elements in resulted array.
    ///   - noRepeats: bool value that indicates whether elemnts in resulted array may be repeatable.
    /// - Returns:
    ///   - array of given count with randomly picked elements of the same type.
    ///
    ///   The result will be an empty array in following cases:
    ///     - if given count is 0 or less than 0
    ///     - if called array is empty
    func getRandom(_ count: Int, noRepeats: Bool = true) -> [Element] {
        guard count > 0 else { return [Element]() }

        if count >= self.count && noRepeats { return self }

        var result = [Element]()
        var eligableIndexes = Set(0..<self.count)

        for _ in 0..<count {

            guard let randomIndex = eligableIndexes.randomElement() else {
                //according to documentation, randomElement returns nil only if collection is empty
                //in which case, return the result as it is
                return result
            }

            //append random element to result array
            //nb: there should be no cases when the index is not safe, but still
            if self.isSafe(randomIndex) { result.append(self[randomIndex]) }

            //if repeats are not allowed, remove index from eligable indexes set
            if noRepeats { eligableIndexes.remove(randomIndex) }
        }

        return result
    }

    /// Convenient method to take first `n` elements from the array.
    ///
    /// - Parameters:
    ///   - n: the number of elements to be returned starting from index 0.
    /// - Returns:
    ///   - new array with elements in range [0; n] or copy of self if there are less than `n` elements in original array
    func first(_ n: Int) -> [Element] {
        return (self.count <= n) ? self : Array(self[..<n])
    }

    /// A modification of Swift's `map` function to include the elements in the result array only if the `transform` resulted in some value and not nil.
    /// Thus, the result array can have same count or less elements (down to zero) than the original array.
    ///
    /// - Parameters:
    ///   - transform: A mapping closure. `transform` accepts an element of original array as its parameter and returns a transformed
    ///   value of the type of element in resulted array..
    /// - Returns:
    ///   - new array containing transformed elements.
    func mapOptional<T>(_ transform: (Element) -> T?) -> [T] {
        var resultArray = [T]()

        for originalElement in self {
            if let newElement = transform(originalElement) {
                resultArray.append(newElement)
            }
        }

        return resultArray
    }
}
