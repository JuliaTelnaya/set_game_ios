//
//  Array+Only.swift
//  memorius
//
//  Created by Юлия Тельная on 20.06.2020.
//  Copyright © 2020 Юлия Тельная. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
