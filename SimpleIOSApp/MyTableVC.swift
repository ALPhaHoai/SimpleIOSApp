//
//  MyTableVC.swift
//  SwiftIOS_EUP_Test1
//
//  Created by Bruce on 2019-03-11.
//  Copyright © 2019 Bruce. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class MyTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var isAbnormal = false;

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = true


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

        datePicker.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)


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

        getDatafromApi()

        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: false)
        }
    }


    private var data: [[String: Any]] = [[String: Any]]() {
        didSet {
            self.tableView.reloadData()
        }
    }


    private func getDatafromApi() {
        let endPoint = "http://14.232.214.186:8080/Eup_Java_WorkHour/EDriver_SOAP"
        let parameters: Parameters = [
            "Param": "{\"DriverID\":3000002,\"Date\":\"2018\\/12\\/28\",\"MethodName\":\"GetDispatchCarOrderByDriverID\"}"
        ]
        AF.request(endPoint, method: .get, parameters: parameters).responseJSON { res in
            if let result = res.result.value as! [String: Any]? {
                if let data = result["result"] as! [[String: Any]]? {
                    for var item in data {
                        if (item["IsAbnormal"] as? Int ?? 0 == 0) == self.isAbnormal {
                            self.data.append(item)
                        }
                    }
                }
            }
        }
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
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableCell

        let item = self.data[indexPath.row]

        cell.StartAddress.text = item["StartAddress"] as? String ?? ""
        cell.EndAddress.text = item["EndAddress"] as? String ?? ""

        cell.EstimatedStatrtTime.text = item["EstimatedStatrtTime"] as? String ?? ""
        cell.Order_Number.text = item["Order_Number"] as? String ?? ""
        cell.EndContactPhone.text = item["EndContactPhone"] as? String ?? ""

        print("\(item)\n")

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
let item = self.data[indexPath.row]
        let vc = MyMapVC()

//        present(vc, animated: false)
        self.navigationController?.pushViewController(vc, animated: false)
//        self.navigationController?.present(vc, animated: false)

        vc.StartAddress.text = item["StartAddress"] as? String ?? ""
        vc.EndAddress.text = item["EndAddress"] as? String ?? ""
        vc.EstimatedStatrtTime.text = item["EstimatedStatrtTime"] as? String ?? ""
        vc.Order_Number.text = item["Order_Number"] as? String ?? ""
        vc.EndContactPhone.text = item["EndContactPhone"] as? String ?? ""

    }



}


