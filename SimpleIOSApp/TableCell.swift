//
// Created by Bruce on 2019-03-12.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import UIKit
import SnapKit

class TableCell: UITableViewCell {


    //adding spacing between table cell
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set(newFrame) {
            var frame = newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 9
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.masksToBounds = false
    }

    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white

        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 1.0
        view.layer.masksToBounds = false
        view.clipsToBounds = false
        view.layer.cornerRadius = 3

        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.5)

        return view
    }()


    func getSmallGroupIconText(icon: UIImage, text: String) -> UIView {
        let smallGroup = UIView()

        let smallImage = UIImageView(image: icon)
        smallImage.contentMode = .scaleAspectFit
        smallGroup.addSubview(smallImage)
        smallImage.snp.makeConstraints { maker -> Void in
            maker.leading.top.bottom.equalTo(smallGroup)
        }


        let smallTextLabel = UILabel()
        smallTextLabel.text = text
        smallTextLabel.font = smallTextLabel.font.withSize(14)
        smallTextLabel.textColor = #colorLiteral(red: 0.493902439, green: 0.5, blue: 0.5, alpha: 1)
        smallGroup.addSubview(smallTextLabel)
        smallTextLabel.snp.makeConstraints { maker -> Void in
            maker.leading.equalTo(smallImage.snp.trailing).offset(10)
            maker.top.bottom.equalTo(smallGroup)
        }

        return smallGroup

    }


    func  getLabelTitle(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.padding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        label.textColor = #colorLiteral(red: 0.2548794746, green: 0.254914552, blue: 0.2548675537, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }

    func getButton(text: String, bgColor: UIColor) -> UIButton {
        let button1 = UIButton(type: .custom)
        button1.setTitle(text, for: .normal)

        button1.layer.borderWidth = 0.1
        button1.layer.borderColor = UIColor.black.cgColor
        button1.layer.cornerRadius = 3;


        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOffset = CGSize(width: 0, height: 0)
        button1.layer.shadowRadius = 20
        button1.layer.shadowOpacity = 0.5


        // this value vary as per your desire
        button1.clipsToBounds = true
        button1.backgroundColor = bgColor
        return button1
    }

    func getGroupButton() -> UIView {
        let groupButton = UIView()
        let button1 = getButton(text: "Button 1", bgColor: #colorLiteral(red: 0.7711191705, green: 0.1692700618, blue: 0.1692700618, alpha: 1))

        groupButton.addSubview(button1)
        button1.snp.makeConstraints { maker -> Void in

            maker.width.lessThanOrEqualTo(groupButton.snp.width).dividedBy(3)
            maker.leading.equalTo(groupButton.snp.leading)
            maker.top.bottom.equalTo(groupButton)

        }

        let button2 = getButton(text: "Button 2", bgColor: #colorLiteral(red: 0.7711191705, green: 0.1692700618, blue: 0.1692700618, alpha: 1))

        groupButton.addSubview(button2)
        button2.snp.makeConstraints { maker -> Void in
            maker.width.lessThanOrEqualTo(groupButton.snp.width).dividedBy(3)
            maker.centerX.equalTo(groupButton.snp.centerX)
            maker.leading.equalTo(button1.snp.trailing).offset(5)
            maker.top.bottom.equalTo(groupButton)

        }

        let button3 = getButton(text: "Button 3", bgColor: #colorLiteral(red: 0.9477817358, green: 0.6893126696, blue: 0.007571336754, alpha: 1))
        groupButton.addSubview(button3)
        button3.snp.makeConstraints { maker -> Void in
            maker.width.lessThanOrEqualTo(groupButton.snp.width).dividedBy(3)
            maker.trailing.equalTo(groupButton.snp.trailing)
            maker.leading.equalTo(button2.snp.trailing).offset(5)
            maker.top.bottom.equalTo(groupButton)

        }

        return groupButton
    }

    func getCell() {

    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    func setup() {
        backgroundColor = UIColor(r: 245, g: 245, b: 245)
        addSubview(cellView)


        //clockTitleGroup
        let clockTitleGroup = UIView()

        let clockImage = UIImageView(image: #imageLiteral(resourceName: "clock-title").resizeImage(targetSize: CGSize(width: 15, height: 15)))
        clockImage.contentMode = .center
        clockTitleGroup.addSubview(clockImage)
        clockImage.snp.makeConstraints { maker -> Void in
            maker.leading.top.bottom.equalTo(clockTitleGroup)
        }

        clockTitleGroup.layer.shadowColor = UIColor.black.cgColor
        clockTitleGroup.layer.shadowOffset = CGSize(width: 0, height: 1)
        clockTitleGroup.layer.shadowOpacity = 0.1
        clockTitleGroup.layer.shadowRadius = 0.5
        clockTitleGroup.layer.masksToBounds = false
        clockTitleGroup.clipsToBounds = false
        clockTitleGroup.layer.cornerRadius = 3

        clockTitleGroup.layer.borderWidth = 1
        clockTitleGroup.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.5)

        let clockTitleText = UILabel()
        clockTitleText.text = "2018/10/30"
        clockTitleText.font = clockTitleText.font.withSize(14)
        clockTitleText.textColor = .gray
        clockTitleGroup.addSubview(clockTitleText)
        clockTitleText.snp.makeConstraints { maker -> Void in
            maker.leading.equalTo(clockImage.snp.trailing).offset(8)
            maker.top.bottom.equalTo(clockTitleGroup)
        }


        cellView.addSubview(clockTitleGroup)
        clockTitleGroup.backgroundColor = #colorLiteral(red: 0.7630656732, green: 0.772486237, blue: 0.772486237, alpha: 0.3872139085)
        clockTitleGroup.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(cellView)
            maker.leading.trailing.equalTo(cellView)
            maker.height.equalTo(40)
        }

        let rectangle = UIView()
        cellView.addSubview(rectangle)
        rectangle.snp.makeConstraints { maker -> Void in
            maker.bottom.trailing.leading.equalTo(cellView)
            maker.top.equalTo(clockTitleGroup.snp.bottom)
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

        let topTitleLabel = getLabelTitle(text: "This is top title label")
        rightContent.addSubview(topTitleLabel)
        topTitleLabel.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(rightContent.snp.top).offset(10)
        }


        let smallTextandIconGroup = getSmallTextandIconGroup(parentView: rightContent)
        smallTextandIconGroup.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(topTitleLabel.snp.bottom)
            maker.leading.equalTo(rightContent.snp.leading).offset(20)
        }


        let bottomTitleLabel = getLabelTitle(text: "This is bottom title label")
        rightContent.addSubview(bottomTitleLabel)
        bottomTitleLabel.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(smallTextandIconGroup.snp.bottom)
        }


        let groupButton = getGroupButton()
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

        clockImage.snp.makeConstraints { maker -> Void in
            maker.centerX.equalTo(leftUIView.snp.centerX)
        }

        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)

    }

    func getSmallTextandIconGroup(parentView: UIView) -> UIView {
        let maginTopBottom = 0
        let smallTextandIconGroup = UIView()
        parentView.addSubview(smallTextandIconGroup)


        let smallGroupIconText1 = getSmallGroupIconText(icon: #imageLiteral(resourceName: "clock-detail"), text: "2018/10/30 10:00")
        smallTextandIconGroup.addSubview(smallGroupIconText1)
        smallGroupIconText1.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(smallTextandIconGroup).offset(maginTopBottom)
        }

        let smallGroupIconText2 = getSmallGroupIconText(icon: #imageLiteral(resourceName: "dropbox-detail"), text: "Abcabc123")
        smallTextandIconGroup.addSubview(smallGroupIconText2)
        smallGroupIconText2.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(smallGroupIconText1.snp.bottom).offset(5)
        }
        let smallGroupIconText3 = getSmallGroupIconText(icon: #imageLiteral(resourceName: "phone-detail"), text: "0988 123 1231")
        smallTextandIconGroup.addSubview(smallGroupIconText3)
        smallGroupIconText3.snp.makeConstraints { maker -> Void in
            maker.top.equalTo(smallGroupIconText2.snp.bottom).offset(5)
            maker.bottom.equalTo(smallTextandIconGroup.snp.bottom).offset(-maginTopBottom)
        }
        return smallTextandIconGroup
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

public class SimpleLine: UIView {

    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        backgroundColor = .white
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.move(to: CGPoint(x: 40, y: 40))
        context.addLine(to: CGPoint(x: 280, y: 300))
        context.strokePath()
    }
}
