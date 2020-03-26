//
//  RandomAccessCollectionExtension.swift
//  News
//
//  Created by Alina on 24.03.2020.
//  Copyright © 2020 rugarusik. All rights reserved.
//

import SwiftUI

extension RandomAccessCollection where Self.Element: Identifiable {
    public func isLast(_ item: Element)->Bool {
        guard isEmpty == false else {
            return false
        }
        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) })  else {
            return false
        }
        return distance(from: itemIndex, to: endIndex) == 1
    }
}
