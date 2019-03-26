//
// Created by Bruce on 2019-03-20.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        customTabBar()

    }

    private func customTabBar() {
        //move tabbar to the top
        var tabFrame: CGRect = self.tabBar.frame
        tabFrame.origin.y = self.view.frame.origin.y
        self.tabBar.frame = tabFrame

        //self.tabBar.directionalLayoutMargins = NSDirectionalEdgeInsets(top: self.tabBar.directionalLayoutMargins.top, leading: self.tabBar.directionalLayoutMargins.leading, bottom: -20, trailing: self.tabBar.directionalLayoutMargins.trailing)


        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.tintColor = UIColor.black
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8117018342, green: 0.8118000031, blue: 0.8116685748, alpha: 1)
        self.tabBar.barStyle = UIBarStyle(rawValue: 0)!
    }


    private func setUpTabBar() {
        let leftVC = LeftViewController()
//        let leftVC = UINavigationController(rootViewController: LeftViewController())
        leftVC.title = "Left View"

        let rightVC = RightViewController()
//        let rightVC =  UINavigationController(rootViewController: RightViewController())
        rightVC.title = "Right View"

        self.viewControllers = [leftVC, rightVC]


    }
}
