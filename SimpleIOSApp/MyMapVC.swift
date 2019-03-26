//
// Created by Bruce on 2019-03-26.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MyMapVC: UIViewController {
    let topTitlePanel: UIView = {
        let topTitlePanel = UIView()

        let titleLabel1 = UILabel()
        titleLabel1.text = "Customer code: AHFSK"
        titleLabel1.font = UIFont.boldSystemFont(ofSize: 18.0)
        topTitlePanel.addSubview(titleLabel1)
        titleLabel1.snp.makeConstraints { maker in
            maker.top.leading.equalToSuperview()
        }

        let titleLabel2 = UILabel()
        titleLabel2.text = "Postal code: 3543"
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 18.0)
        topTitlePanel.addSubview(titleLabel2)
        titleLabel2.snp.makeConstraints { maker in
            maker.top.trailing.equalToSuperview()
        }

        let titleLabel3 = UILabel()
        titleLabel3.text = "Project: ABCfd434"
        titleLabel3.font = UIFont.boldSystemFont(ofSize: 18.0)
        topTitlePanel.addSubview(titleLabel3)
        titleLabel3.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel1.snp.bottom)
            maker.leading.equalTo(titleLabel1.snp.leading)
            maker.bottom.equalToSuperview()
        }
        return topTitlePanel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    private func setUpView() {
        view.backgroundColor = .white

        let mainView = UIView()

        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.cgColor

        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width: 0, height: 1)
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.shadowRadius = 0.5
        mainView.layer.masksToBounds = false
        mainView.clipsToBounds = false
        mainView.layer.cornerRadius = 3


        view.addSubview(mainView)

        mainView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().offset(10)
            maker.bottom.equalToSuperview().offset(-20)
        }

        mainView.addSubview(topTitlePanel)
        topTitlePanel.snp.makeConstraints { maker in
            maker.leading.trailing.top.equalToSuperview()
        }


        let rectangle = UIView()
        mainView.addSubview(rectangle)
        rectangle.snp.makeConstraints { maker in
            maker.leading.trailing.bottom.equalToSuperview()
            maker.top.equalTo(topTitlePanel.snp.bottom)
        }

        let content = UIView()
        rectangle.addSubview(content)
        content.snp.makeConstraints { maker -> Void in
            maker.top.trailing.leading.equalTo(rectangle)
        }


        let leftUIView = UIView()

        let markerCircleRedList = UIImageView(image: #imageLiteral(resourceName: "marker-circle-red-list").resizeImage(targetSize: CGSize(width: 12, height: 12)))

        markerCircleRedList.contentMode = .scaleAspectFit
        leftUIView.addSubview(markerCircleRedList);
        markerCircleRedList.snp.makeConstraints { maker -> Void in
            //maker.top.equalTo(leftUIView.snp.top)
            maker.centerX.equalTo(leftUIView.snp.centerX)
        }

        let markerMapDetail = UIImageView(image: #imageLiteral(resourceName: "marker-map-detail").resizeImage(targetSize: CGSize(width: 15, height: 15)))
        markerMapDetail.contentMode = .scaleAspectFit
        leftUIView.addSubview(markerMapDetail);
        markerMapDetail.snp.makeConstraints { maker -> Void in
            maker.centerX.equalTo(leftUIView.snp.centerX)
            //maker.bottom.equalTo(leftUIView.snp.bottom)
        }

        let lineDot = UIImageView(image: #imageLiteral(resourceName: "line-dot"))
        lineDot.contentMode = .scaleAspectFit
        leftUIView.addSubview(lineDot);
        lineDot.snp.makeConstraints { maker -> Void in
            maker.center.equalTo(leftUIView.snp.center)
            maker.top.equalTo(markerCircleRedList.snp.bottom)
            maker.bottom.equalTo(markerMapDetail.snp.top)
        }

        content.addSubview(leftUIView)
        leftUIView.snp.makeConstraints { maker -> Void in
            maker.leading.equalTo(content.snp.leading).offset(10)
            maker.centerY.equalTo(content.snp.centerY)
            maker.width.equalTo(20)
            maker.height.lessThanOrEqualTo(content.snp.height).multipliedBy(0.8)
        }

        let rightContent = UIView();
        content.addSubview(rightContent)
        rightContent.snp.makeConstraints { maker -> Void in
            maker.top.trailing.bottom.equalTo(content)
            maker.leading.equalTo(leftUIView.snp.trailing).offset(10)
        }

        let topTitleLabel = TableCell().getLabelTitle(text: "This is top title label")
        rightContent.addSubview(topTitleLabel)
        topTitleLabel.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(rightContent.snp.top).offset(10)
        }


        let smallTextandIconGroup = TableCell().getSmallTextandIconGroup(parentView: rightContent)
        smallTextandIconGroup.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(topTitleLabel.snp.bottom)
            maker.leading.equalTo(rightContent.snp.leading).offset(20)
        }


        let bottomTitleLabel = TableCell().getLabelTitle(text: "This is bottom title label")
        rightContent.addSubview(bottomTitleLabel)
        bottomTitleLabel.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(smallTextandIconGroup.snp.bottom)
        }


        let groupButton = TableCell().getGroupButton()
        rectangle.addSubview(groupButton)
        groupButton.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(content.snp.bottom).offset(10)
            maker.bottom.equalTo(rectangle.snp.bottom).offset(-10)
            maker.trailing.equalTo(rectangle.snp.trailing).offset(-10)
        }


        markerCircleRedList.snp.makeConstraints { maker -> Void in
            maker.top.equalToSuperview().offset(10)
        }

        markerMapDetail.snp.makeConstraints { maker -> Void in
            maker.centerY.lessThanOrEqualTo(bottomTitleLabel.snp.centerY)
        }





    }
}