//
//  UIViewController.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import UIKit

extension UIViewController {
    func registerForKeyboardWillShowNotification(_ scrollView: UIScrollView, usingBlock block: ((CGSize?) -> Void)? = nil) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil, using: { [weak scrollView] (notification) -> Void in
            guard let scrollView = scrollView else { block?(.zero); return }
            let userInfo = notification.userInfo!
            let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsetsMake(scrollView.contentInset.top, scrollView.contentInset.left, keyboardSize.height, scrollView.contentInset.right)
            
            scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
            block?(keyboardSize)
        })
    }
    
    func registerForKeyboardDidShowNotification(_ scrollView: UIScrollView, usingBlock block: ((CGSize?) -> Void)? = nil) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: nil, using: { [weak scrollView] (notification) -> Void in
            guard let scrollView = scrollView else { block?(.zero); return }
            let userInfo = notification.userInfo!
            let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsetsMake(scrollView.contentInset.top, scrollView.contentInset.left, keyboardSize.height, scrollView.contentInset.right)
            
            scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
            block?(keyboardSize)
        })
    }
    
    func registerForKeyboardWillHideNotification(_ scrollView: UIScrollView, usingBlock block: ((Void) -> Void)? = nil) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil, using: { [weak scrollView] (notification) -> Void in
            guard let scrollView = scrollView else { block?(); return }
            let contentInsets = UIEdgeInsetsMake(scrollView.contentInset.top, scrollView.contentInset.left, 0, scrollView.contentInset.right)
            scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
            block?()
        })
    }
}
