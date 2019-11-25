//
//  FloatingLabelTextField.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SwifterSwift

enum FloatingLabelTextFieldType: Equatable
{
    case text
    // TODO: add in future managing DATE
}

class FloatingLabelTextField: SkyFloatingLabelTextField
{
    var type: FloatingLabelTextFieldType = .text
    {
        didSet
        {
            switch self.type
            {
            // TODO: add in future managing DATE
            default:
                self.inputView = nil
            }
        }
    }
    
    
    
    // TOOLBAR
    lazy var toolbarInputAccessoryView: UIToolbar =
    {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: 320.0, height: 44.0)))
        
        let flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let nextButton = UIBarButtonItem(title: NSLocalizedString("info.next", comment: ""), style: .plain, target: self, action: #selector(self.nextAction))
        nextButton.tintColor = .black
        
        toolbar.setItems([flexibleSpaceButton, nextButton], animated: false)
        toolbar.tintColor = .lightGray
        
        return toolbar
    }()
    
    @objc fileprivate func nextAction()
    {
        _ = self.delegate?.textFieldShouldReturn?(self)
    }
    
    var readOnly: Bool = false
    {
        didSet
        {
            self.isEnabled = !self.readOnly
        }
    }
    
    func configure(type: FloatingLabelTextFieldType = .text, placeholder: String? = nil, showToolBar: Bool = false)
    {
        self.type = type
        self.placeholder = placeholder
        self.inputAccessoryView = showToolBar ? self.toolbarInputAccessoryView : nil
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.titleLabel.numberOfLines = 2
        
        if let _font = self.font
        {
            self.titleFont = _font.withSize(_font.pointSize-2)
        }
        
        self.titleFormatter =
        { (text: String) -> String in
            if #available(iOS 9.0, *)
            {
                return NSLocalizedString(text, comment: "")
            }
            else
            {
                return text
            }
        }
        
        if #available(iOS 12.0, *)
        {
            self.textContentType = .oneTimeCode
        }
    }
    
    override func titleHeight() -> CGFloat
    {
        if let titleLabel = titleLabel, let font = titleLabel.font
        {
            return font.lineHeight*CGFloat(titleLabel.numberOfLines)
        }
        return 15.0
    }
    
    override open var font: UIFont?
    {
        didSet
        {
            if let _font = self.font
            {
                self.titleFont = _font.withSize(_font.pointSize-2)
            }
        }
    }
}
