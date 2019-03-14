//
// Created by Bruce on 2019-03-12.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import UIKit

class BandCell: UITableViewCell {

    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.setCellShadow()
        return view
    }()

    let pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        return label
    }()
    let groupButton: UIView = {
        let groupButton = UIView()


        let button1 = UIButton(type: .custom)
        button1.setTitle("Button 1", for: .normal)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.backgroundColor = .red
        button1.layer.cornerRadius = 5;
        // this value vary as per your desire
        button1.clipsToBounds = true;

        groupButton.addSubview(button1)
        button1.snp.makeConstraints { maker -> Void in

            maker.width.equalTo(groupButton.snp.width).dividedBy(3)
            maker.leading.equalTo(groupButton.snp.trailing).offset(-2)
            //maker.centerX.equalTo(groupButton.snp.centerX)

        }


        let button2 = UIButton(type: .custom)
        button2.setTitle("Button 2", for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        groupButton.addSubview(button2)
        button2.backgroundColor = .red
        button2.layer.cornerRadius = 5;
        // this value vary as per your desire
        button2.clipsToBounds = true;


        button2.snp.makeConstraints { maker -> Void in
            maker.width.equalTo(groupButton.snp.width).dividedBy(3)
            maker.centerX.equalTo(groupButton.snp.centerX)

        }


        let button3 = UIButton(type: .custom)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.setTitle("Button 3", for: .normal)
        button3.backgroundColor = .yellow
        button3.layer.cornerRadius = 5;
        // this value vary as per your desire
        button3.clipsToBounds = true;
        groupButton.addSubview(button3)

        button3.snp.makeConstraints { maker -> Void in
            maker.width.equalTo(groupButton.snp.width).dividedBy(3)
            maker.trailing.equalTo(groupButton.snp.leading).offset(-2)
            //maker.centerX.equalTo(groupButton.snp.centerX)

        }

        return groupButton


    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    func setup() {
        backgroundColor = UIColor(r: 245, g: 245, b: 245)
        addSubview(cellView)
        cellView.addSubview(pictureImageView)
        cellView.addSubview(titleLabel)

        cellView.addSubview(groupButton)
        groupButton.snp.makeConstraints { maker -> Void in

            maker.bottom.equalTo(cellView.snp.bottom)
            maker.trailing.equalTo(cellView.snp.trailing)

        }


        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)

        pictureImageView.setAnchor(top: nil, left: cellView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true

        titleLabel.setAnchor(top: nil, left: pictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 40)
        titleLabel.centerYAnchor.constraint(equalTo: pictureImageView.centerYAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
