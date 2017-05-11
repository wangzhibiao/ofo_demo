//
//  ActiveController.swift
//  OfoDemo
//
//  Created by 王小帅 on 2017/5/11.
//  Copyright © 2017年 王小帅. All rights reserved.
//

import UIKit

class ActiveController: UIViewController {

    // 展示活动的webview
    var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 标题
        self.title = "热门活动"
        
        // 初始化webview
        webView = UIWebView(frame: self.view.bounds)
        webView.scalesPageToFit = true
        view.addSubview(webView)
        
        // 加载url
        let url = URL(string: "http://m.ofo.so/active.html")
        webView.loadRequest(URLRequest(url: url!))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
