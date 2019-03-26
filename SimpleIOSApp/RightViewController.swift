//
//  RightViewController.swift
//  SwiftIOS_EUP_Test1
//
//  Created by Bruce on 2019-03-20.
//  Copyright © 2019 Bruce. All rights reserved.
//

import UIKit
import SnapKit

class RightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableVIew: UITableView = {
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

        titlePanel.addSubview(textLabel)


        //add datepicker
        let datePicker = UIButton()
        datePicker.setTitle("20/01/2019", for: .normal)
        datePicker.layer.borderWidth = 1
        datePicker.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.5)
        titlePanel.addSubview(datePicker)
        datePicker.snp.makeConstraints { maker -> Void in
            maker.trailing.equalTo(titlePanel.snp.trailing)
        }
        textLabel.snp.makeConstraints { maker -> Void in
            maker.trailing.equalTo(titlePanel.snp.leading)
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
        view.addSubview(titlePanel)

    }

    func setupTableView() {
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(TableCell.self, forCellReuseIdentifier: cellId)

        view.addSubview(tableVIew)
        tableVIew.snp.makeConstraints { maker in
            maker.leading.trailing.bottom.equalTo(view)
            maker.top.equalTo(titlePanel.snp.bottom)
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
//        cell.pictureImageView.image = UIImage(named: bandsArray[indexPath.item].image!)
        return cell
    }


}


