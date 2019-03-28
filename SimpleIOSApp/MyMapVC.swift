//
// Created by Bruce on 2019-03-26.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Alamofire

class MyMapVC: UIViewController {
    var StartAddress = UILabel()
    var EndAddress = UILabel()

    var EstimatedStatrtTime = UILabel()
    var Order_Number = UILabel()
    var EndContactPhone = UILabel()

    let topTitlePanel: UIView = {
        let topTitlePanel = UIView()
        let fontSize: CGFloat = 14.0;
        let maginLeadingTrailing = 10
        let marginTopBottom = 10

        let titleLabel1 = UILabel()
        titleLabel1.text = "Customer code: AHFSK"
        titleLabel1.font = UIFont.systemFont(ofSize: fontSize)
        topTitlePanel.addSubview(titleLabel1)
        titleLabel1.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(marginTopBottom)
            maker.leading.equalToSuperview().offset(maginLeadingTrailing)
        }

        let titleLabel2 = UILabel()
        titleLabel2.text = "Postal code: 3543"
        titleLabel2.font = UIFont.systemFont(ofSize: fontSize)
        topTitlePanel.addSubview(titleLabel2)
        titleLabel2.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel1.snp.top)
            maker.trailing.equalToSuperview().offset(-maginLeadingTrailing)
        }

        let titleLabel3 = UILabel()
        titleLabel3.text = "Project: ABCfd434"
        titleLabel3.font = UIFont.systemFont(ofSize: fontSize)
        topTitlePanel.addSubview(titleLabel3)
        titleLabel3.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel1.snp.bottom)
            maker.leading.equalTo(titleLabel1.snp.leading)
            maker.bottom.equalToSuperview().offset(-marginTopBottom)
        }

        //add border and shadow
        topTitlePanel.layer.shadowColor = UIColor.black.cgColor
        topTitlePanel.layer.shadowOffset = CGSize(width: 0, height: 1)
        topTitlePanel.layer.shadowOpacity = 0.1
        topTitlePanel.layer.shadowRadius = 0.5
        topTitlePanel.layer.masksToBounds = false
        topTitlePanel.clipsToBounds = false
        topTitlePanel.layer.cornerRadius = 3

        topTitlePanel.layer.borderWidth = 1
        topTitlePanel.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.5)


        return topTitlePanel
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    private func setUpView() {
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "sample_google_map"))

        let mainView = UIView()
        view.addSubview(mainView)
        mainView.backgroundColor = .white
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width: 0, height: 1)
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.shadowRadius = 0.5
        mainView.layer.masksToBounds = false
        mainView.clipsToBounds = false
        mainView.layer.cornerRadius = 3

        mainView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(10)
            maker.trailing.equalToSuperview().offset(-10)
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

        let markerCircleRedList = UIImageView(image: #imageLiteral(resourceName: "marker-circle-red-detail").resizeImage(targetSize: CGSize(width: 20, height: 20)))

        markerCircleRedList.contentMode = .scaleAspectFit
        leftUIView.addSubview(markerCircleRedList);
        markerCircleRedList.snp.makeConstraints { maker -> Void in
            //maker.top.equalTo(leftUIView.snp.top)
            maker.centerX.equalTo(leftUIView.snp.centerX)
        }

        let markerMapDetail = UIImageView(image: #imageLiteral(resourceName: "marker-map-detail").resizeImage(targetSize: CGSize(width: 24, height: 24)))
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

        self.StartAddress = TableCell().getLabelTitle()
        rightContent.addSubview(self.StartAddress)
        self.StartAddress.snp.makeConstraints { maker -> Void in
            maker.top.equalToSuperview().offset(10)
        }


        let smallTextandIconGroup = TableCell().getSmallTextandIconGroup()
        rightContent.addSubview(smallTextandIconGroup)
        smallTextandIconGroup.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(self.StartAddress.snp.bottom)
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.lessThanOrEqualToSuperview()
        }


        self.EndAddress = TableCell().getLabelTitle()
        rightContent.addSubview(self.EndAddress)
        self.EndAddress.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(smallTextandIconGroup.snp.bottom)
            maker.leading.equalToSuperview()
            maker.trailing.lessThanOrEqualToSuperview()
        }


//        let smallTextandIconGroup2 = TableCell().getSmallTextandIconGroup()
//        rightContent.addSubview(smallTextandIconGroup2)
//        smallTextandIconGroup2.snp.makeConstraints { maker -> Void in
//            maker.top.equalTo(self.EndAddress.snp.bottom)
//            maker.leading.equalToSuperview().offset(20)
//        }


        let groupButton = TableCell().getGroupButton(textArray: ["  Abnormal  ","  Not arrived  ", "  Not Recieved  " ])
        rectangle.addSubview(groupButton)
        groupButton.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(content.snp.bottom).offset(10)
            maker.bottom.equalToSuperview().offset(-10)
            maker.trailing.equalToSuperview().offset(-10)
        }


        markerCircleRedList.snp.makeConstraints { maker -> Void in
//            maker.top.equalToSuperview().offset(10)
            maker.centerY.equalTo(self.StartAddress.snp.centerY)
        }

        markerMapDetail.snp.makeConstraints { maker -> Void in
            maker.centerY.lessThanOrEqualTo(self.EndAddress.snp.centerY)
        }


    }
}
