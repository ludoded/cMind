//
//  MainViewController.swift
//  cMind Interview
//
//  Created by Haik Ampardjian on 12/27/16.
//  Copyright © 2016 cMind. All rights reserved.
//

import UIKit
import Kingfisher

final class MainViewController: UIViewController {
    let viewModel = MainViewModel()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var webBox: MindWebView!
    @IBOutlet weak var imageBox: MindImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNotifyingReachability()
        setupScroller()
        setupImageViewTap()
        setupWebView()
    }
    
    private func setupScroller() {
        registerForKeyboardDidShowNotification(scrollView)
        registerForKeyboardWillHideNotification(scrollView)
    }
    
    private func setupImageViewTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
        imageBox.addGestureRecognizer(tap)
    }
    
    private func setupWebView() {
        webBox.startSpinning()
        webBox.webView.loadRequest(viewModel.googleRequest)
    }
    
    private func toggleImage() {
        guard let resource = viewModel.randomImageResource() else { return }
        
        imageBox.startLoading()
        imageBox.imageView.kf.setImage(with: resource, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { [weak self] image, error, _, _ in
            self?.imageBox.stopLoading()
            guard error == nil else { self?.showError(errorText: error?.localizedDescription ?? ""); return }
            self?.imageBox.imageView.image = image
        })
    }
    
    @objc private func tapImage(_: UITapGestureRecognizer) {
        toggleImage()
    }
}

extension MainViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        /// When a link is clicked
        if navigationType == .linkClicked {
            if viewModel.validate(request: request) { performSegue(withIdentifier: "showList", sender: nil) }
            return false
        }
        
        return true
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        webBox.stopSpinning()
        showError(errorText: error.localizedDescription)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webBox.stopSpinning()
    }
}
