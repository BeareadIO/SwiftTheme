//
//  AsyncDisplayKit+Theme.swift
//  SwiftTheme
//
//  Created by Chao Zhang on 2019/5/2.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation
import AsyncDisplayKit

@objc public extension ASDisplayNode
{
    var theme_alpha: ThemeCGFloatPicker? {
        get { return getThemePicker(self, "setAlpha:") as? ThemeCGFloatPicker }
        set { setThemePicker(self, "setAlpha:", newValue) }
    }
    var theme_backgroundColor: ThemeColorPicker? {
        get { return getThemePicker(self, "setBackgroundColor:") as? ThemeColorPicker }
        set { setThemePicker(self, "setBackgroundColor:", newValue) }
    }
    var theme_tintColor: ThemeColorPicker? {
        get { return getThemePicker(self, "setTintColor:") as? ThemeColorPicker }
        set { setThemePicker(self, "setTintColor:", newValue) }
    }
    var theme_shadowColor: ThemeCGColorPicker? {
        get { return getThemePicker(self, "setShadowColor:") as? ThemeCGColorPicker }
        set { setThemePicker(self, "setShadowColor:", newValue) }
    }
    var theme_borderColor: ThemeCGColorPicker? {
        get { return getThemePicker(self, "setBorderColor:") as? ThemeCGColorPicker }
        set { setThemePicker(self, "setBorderColor:", newValue) }
    }
    var theme_borderWidth: ThemeCGFloatPicker? {
        get { return getThemePicker(self, "setBorderWidth:") as? ThemeCGFloatPicker }
        set { setThemePicker(self, "setBorderWidth:", newValue) }
    }
}

@objc public extension ASTextNode
{
    var theme_attributedText: ThemeAttributedStringPicker? {
        get { return getThemePicker(self, "setAttributedText:") as? ThemeAttributedStringPicker }
        set { setThemePicker(self, "setAttributedText:", newValue) }
    }
}

@objc public extension ASTextNode2
{
    var theme_attributedText: ThemeAttributedStringPicker? {
        get { return getThemePicker(self, "setAttributedText:") as? ThemeAttributedStringPicker }
        set { setThemePicker(self, "setAttributedText:", newValue) }
    }
}

@objc public extension ASEditableTextNode
{
    var theme_keyboardAppearance: ThemeKeyboardAppearancePicker? {
        get { return getThemePicker(self, "setKeyboardAppearance:") as? ThemeKeyboardAppearancePicker }
        set { setThemePicker(self, "setKeyboardAppearance:", newValue) }
    }
}

@objc public extension ASImageNode
{
    var theme_image: ThemeImagePicker? {
        get { return getThemePicker(self, "setImage:") as? ThemeImagePicker }
        set { setThemePicker(self, "setImage:", newValue) }
    }
}

@objc public extension ASButtonNode
{
    func theme_setImage(_ picker: ThemeImagePicker?, forState state: UIControl.State) {
        let statePicker = makeStatePicker(self, "setImage:forState:", picker, state)
        setThemePicker(self, "setImage:forState:", statePicker)
    }
    func theme_setBackgroundImage(_ picker: ThemeImagePicker?, forState state: UIControl.State) {
        let statePicker = makeStatePicker(self, "setBackgroundImage:forState:", picker, state)
        setThemePicker(self, "setBackgroundImage:forState:", statePicker)
    }
}



private func getThemePicker(
    _ object : NSObject,
    _ selector : String
    ) -> ThemePicker? {
    return object.themePickers[selector]
}

private func setThemePicker(
    _ object : NSObject,
    _ selector : String,
    _ picker : ThemePicker?
    ) {
    object.themePickers[selector] = picker
    object.performThemePicker(selector: selector, picker: picker)
}

private func makeStatePicker(
    _ object : NSObject,
    _ selector : String,
    _ picker : ThemePicker?,
    _ state : UIControl.State
    ) -> ThemePicker? {
    
    var picker = picker
    
    if let statePicker = object.themePickers[selector] as? ThemeStatePicker {
        picker = statePicker.setPicker(picker, forState: state)
    } else {
        picker = ThemeStatePicker(picker: picker, withState: state)
    }
    return picker
}
