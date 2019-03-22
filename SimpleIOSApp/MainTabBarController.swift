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
        var tabFrame:CGRect = self.tabBar.frame
        tabFrame.origin.y = self.view.frame.origin.y
        self.tabBar.frame = tabFrame
        self.tabBar.backgroundColor = UIColor.white

        self.tabBar.tintColor = UIColor.black
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8117018342, green: 0.8118000031, blue: 0.8116685748, alpha: 1)

//        self.tabBar.selectedItem.

//        self.tabBar.barTintColor = #colorLiteral(red: 0.8117018342, green: 0.8118000031, blue: 0.8116685748, alpha: 1)
        self.tabBar.barStyle = UIBarStyle(rawValue: 0)!

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Montserrat-Medium", size: 11)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Montserrat-Medium", size: 11)], for: .selected)

    }


    private func setUpTabBar() {
        let leftVC = LeftViewController()
//        let leftVC = UINavigationController(rootViewController: LeftViewController())
        leftVC.title = "Left View"

        let rightVC =  RightViewController()
//        let rightVC =  UINavigationController(rootViewController: RightViewController())
        rightVC.title = "Right View"

//        addViewController(leftVC)
//        addViewController(rightVC)
//        setFirstViewController(0)
//        setSelectionBar(80, height: 3, color: UIColor(red: 0.23, green: 0.55, blue: 0.92, alpha: 1.0))
//        setButtonsWithSelectedColor(UIFont.systemFont(ofSize: 18), color: UIColor.black, selectedColor: UIColor(red: 0.23, green: 0.55, blue: 0.92, alpha: 1.0))
//        equalSpaces = false


//        let tabPageViewController = TabPageViewController.create()
//        tabPageViewController.tabItems = [(leftVC, "First"), (rightVC, "Second")]
//        tabPageViewController.option.currentColor = UIColor.red

        self.viewControllers = [leftVC, rightVC]

    }
}
