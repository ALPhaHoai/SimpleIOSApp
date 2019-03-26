//
//  MyTableVC.swift
//  SwiftIOS_EUP_Test1
//
//  Created by Bruce on 2019-03-11.
//  Copyright © 2019 Bruce. All rights reserved.
//

import UIKit
import SnapKit

class MyTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false



        return tableView
    }()
    let titlePanel: UIView = {
        let titlePanel = UIView()

        //add uilabel
        let textLabel = UILabel()
        textLabel.text = "Text Label"
        textLabel.textColor = UIColor.black

        titlePanel.addSubview(textLabel)


        //add datepicker
        let datePicker = UIButton()
        datePicker.setTitle("20/01/2019                  ▼", for: .normal)
        datePicker.setTitleColor(UIColor.black, for: .normal)
        datePicker.layer.borderWidth = 1
        datePicker.titleLabel!.font = UIFont.systemFont(ofSize: 13)

        datePicker.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.5)
        titlePanel.addSubview(datePicker)

        datePicker.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)



        datePicker.snp.makeConstraints { maker -> Void in
            maker.trailing.equalTo(titlePanel.snp.trailing)
            maker.centerY.equalTo(titlePanel.snp.centerY)
        }
        textLabel.snp.makeConstraints { maker -> Void in
            maker.trailing.equalTo(datePicker.snp.leading).offset(-20)
            maker.centerY.equalTo(titlePanel.snp.centerY)
        }


        return titlePanel

    }()

    let cellId = "cellId"


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
    }

    func setupViews() {
        navigationItem.title = "First IOS App"
        navigationController?.navigationBar.barTintColor = UIColor(r: 0, g: 255, b: 198)

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableCell.self, forCellReuseIdentifier: cellId)

        view.addSubview(tableView)

        tableView.tableHeaderView = titlePanel
        titlePanel.layoutMargins = UIEdgeInsets(top: 100, left: 10, bottom: 10, right: 10);


        tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(view)
        }
        titlePanel.snp.makeConstraints { maker in
            maker.trailing.equalTo(view.snp.trailing).offset(-18)
            maker.bottom.equalTo(tableView.snp.top).offset(-13)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableCell
        return cell
    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }


//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "01-01-2019"
//    }

}


