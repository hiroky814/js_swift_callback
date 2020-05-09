//
//  ViewController.swift
//  js_swift_callback
//
//  Created by hiroky on 2020/05/09.
//  Copyright © 2020 hiroky.js_swift_callback. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate {

   override func viewDidLoad() {
        super.viewDidLoad()

        let webConfig: WKWebViewConfiguration = WKWebViewConfiguration()
        let userController: WKUserContentController = WKUserContentController()
    
        // コールバック先の登録
        userController.add(self, name: "example")
        webConfig.userContentController = userController
    
        // wkWebViewの作成
        let wkWebView = WKWebView(frame: self.view.bounds, configuration: webConfig)
        wkWebView.navigationDelegate = self
        
        // 遷移先URLの設定
        let urlRequest = URLRequest(url:URL(string:"[URL]")!)
        wkWebView.load(urlRequest)
    
        self.view.addSubview(wkWebView)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("*** callback start ***")
        print("message.name: \(message.name)")
        if message.name == "example" {
            print("message.body: \(message.body)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

