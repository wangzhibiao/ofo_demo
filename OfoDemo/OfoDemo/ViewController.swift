//
//  ViewController.swift
//  OfoDemo
//
//  Created by 王小帅 on 2017/5/11.
//  Copyright © 2017年 王小帅. All rights reserved.
//

import UIKit
import SWRevealViewController


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏ui
        setupNavigationBar()
        
        // 引用SWRevealViewController框架实现侧边抽屉效果
        if let revealVC = revealViewController() {
            // 制定那个item点击出现抽屉效果
            navigationItem.leftBarButtonItem?.target = revealVC
            
            // 制定抽屉的宽度
            revealVC.rearViewRevealWidth = 280.0
            
            // 使用框架默认的弹出方法
            navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            
            // 给view添加一个手势帮助菜单的移动
            view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



// MARK: - 设置界面
private extension ViewController {
    
    // 设置顶部导航栏的左右item和中间的title视图
    func setupNavigationBar(){
        // 设置左右的item为自定义的图片 渲染模式原始不跟随系统
        let leftImage = #imageLiteral(resourceName: "leftTopImage").withRenderingMode(.alwaysOriginal)
        let leftItem = UIBarButtonItem(image: leftImage, style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = leftItem
        
        // 中间自定义视图
        let titleView = #imageLiteral(resourceName: "ofoLogo")
        self.navigationItem.titleView = UIImageView(image: titleView)
        
        // 右边消息按钮
        let rightImage = #imageLiteral(resourceName: "rightTopImage").withRenderingMode(.alwaysOriginal)
        let rightItem = UIBarButtonItem(image: rightImage, style: .plain, target: self, action: #selector(rightItemClick))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    // 右侧的item点击方法需要自定义
    @objc func rightItemClick() {
        
        // 创建活动视图控制器
        let activeVC = ActiveController()
        
        // 加载进来
        navigationController?.pushViewController(activeVC, animated: true)
        
        // 控制返回按钮样式
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}



