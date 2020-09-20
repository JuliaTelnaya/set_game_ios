//
//  Array+Identifible.swift
//  memorius
//
//  Created by Юлия Тельная on 18.06.2020.
//  Copyright © 2020 Юлия Тельная. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil //TODO: bogus!
    }
}
