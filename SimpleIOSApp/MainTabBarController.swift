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
       customUITableView()

    }


    private func customUITableView() {
        //move tabbar to the top
//        var leftVCFrame: CGRect = self.leftVC.view.frame
//        leftVCFrame.origin.y = self.tabBar.frame.origin.y
//        self.leftVC.view.frame = leftVCFrame
    }

    private func customTabBar() {
        //move tabbar to the top
        var tabFrame: CGRect = self.tabBar.frame
        tabFrame.origin.y = self.view.frame.origin.y
        self.tabBar.frame = tabFrame

        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.tintColor = UIColor.black
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8117018342, green: 0.8118000031, blue: 0.8116685748, alpha: 1)
        self.tabBar.barStyle = UIBarStyle(rawValue: 0)!


        let numberOfItems = CGFloat(self.tabBar.items!.count)
        let tabBarItemSize = CGSize(width: self.tabBar.frame.width / numberOfItems, height: 4)

        let selectedUnderline = getImageWithColorPosition(color: #colorLiteral(red: 0.7711191705, green: 0.1692700618, blue: 0.1692700618, alpha: 1), size: CGSize(width: tabBarItemSize.width, height: tabFrame.height), lineSize: tabBarItemSize)
        let unselectedUnderline = getImageWithColorPosition(color: UIColor.lightGray, size: CGSize(width: tabBarItemSize.width, height: tabFrame.height), lineSize: CGSize(width: tabBarItemSize.width, height: tabBarItemSize.height))
        self.tabBar.selectionIndicatorImage = selectedUnderline
        self.tabBar.backgroundImage = unselectedUnderline
    }


    private func setUpTabBar() {
        let leftVC = MyTableVC()
        leftVC.title = "Left View"
        leftVC.tableView.contentInset.top = self.tabBar.frame.height + leftVC.titlePanel.frame.height  + 30


        let rightVC = MyTableVC()
        rightVC.title = "Right View"
        rightVC.tableView.contentInset.top = self.tabBar.frame.height + rightVC.titlePanel.frame.height  + 30

        self.viewControllers = [leftVC, rightVC]

    }
    func getImageWithColorPosition(color: UIColor, size: CGSize, lineSize: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let rectLine = CGRect(x: 0, y: size.height - lineSize.height, width: lineSize.width, height: lineSize.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.setFill()
        UIRectFill(rect)
        color.setFill()
        UIRectFill(rectLine)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
