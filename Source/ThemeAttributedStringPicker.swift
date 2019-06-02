//
//  ThemeAttributedStringPicker.swift
//  bearead
//
//  Created by Chao Zhang on 2019/2/27.
//  Copyright © 2019 Archy. All rights reserved.
//

import Foundation

@objc public final class ThemeAttributedStringPicker: ThemePicker {
    
    public convenience init(keyPath: String = "", map: @escaping (Any?) -> NSAttributedString?) {
        self.init(v: { map(ThemeManager.value(for: keyPath)) })
    }
    
    public convenience init(attributedStrings: NSAttributedString...) {
        self.init(v: { ThemeManager.element(for: attributedStrings) })
    }
    
    public required convenience init(arrayLiteral elements: NSAttributedString...) {
        self.init(v: { ThemeManager.element(for: elements) })
    }
    
}

@objc public extension ThemeAttributedStringPicker {
    
    class func pickerWithKeyPath(_ keyPath: String, mapAttributedString: @escaping (Any?) -> NSAttributedString?) -> ThemeAttributedStringPicker {
        return ThemeAttributedStringPicker(v: { mapAttributedString(ThemeManager.value(for: keyPath)) })
    }
    
    class func pickerWithAttributedStrings(_ array: [NSAttributedString]) -> ThemeAttributedStringPicker {
        return ThemeAttributedStringPicker(v: { ThemeManager.element(for: array) })
    }
    
}

extension ThemeAttributedStringPicker: ExpressibleByArrayLiteral {}
