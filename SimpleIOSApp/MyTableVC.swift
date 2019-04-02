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

    let datePicker: UIDatePicker = {
        let datePicker: UIDatePicker = UIDatePicker()
        // Set some of UIDatePicker properties
        datePicker.timeZone = NSTimeZone.local
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor.white
        return datePicker
    }()
    
    var triangle: UIImageView = {
        let triangle = UIImageView(image: #imageLiteral(resourceName: "black_triangle").resizeImage(targetSize: CGSize(width: 10, height: 10)))
        return triangle
    }()
    
    
    var inputField: UITextField = {
        let inputField = MyTextFieldPadding()
        inputField.textAlignment = .right
        inputField.text = "20/01/2019"
        inputField.layer.borderWidth = 1
        inputField.font = UIFont.systemFont(ofSize: 13)
        inputField.layer.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.5)
        return inputField
    }()
    
    var titlePanel: UIView = {
        let titlePanel = UIView()
        return titlePanel
    }()
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Text Label"
        textLabel.textColor = UIColor.black
        return textLabel
    }()

    let cellId = "cellId"



    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getDatafromApi()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let index = self.tableView.indexPathForSelectedRow {
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
        Alamofire.request(endPoint, method: .get, parameters: parameters).responseJSON { res in
            if let result = res.result.value as! [String: Any]? {
                if let data = result["result"] as! [[String: Any]]? {
                    print(data.count)
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableCell.self, forCellReuseIdentifier: cellId)
        tableView.tableHeaderView = titlePanel
        view.addSubview(tableView)
        
        
        //view.addSubview(datePicker)
        titlePanel.addSubview(textLabel)
        titlePanel.addSubview(inputField)
        inputField.inputView = datePicker
        titlePanel.addSubview(triangle)
        titlePanel.bringSubviewToFront(triangle)
        datePicker.addTarget(self, action: #selector(TestDatePicker.datePickerValueChanged(_:)), for: .valueChanged)

        
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
    
        
        inputField.snp.makeConstraints { maker -> Void in
            maker.trailing.equalTo(titlePanel.snp.trailing).offset(-20)
            maker.height.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
        titlePanel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        //titlePanel.backgroundColor = .blue
        
        textLabel.snp.makeConstraints { maker -> Void in
            maker.trailing.equalTo(inputField.snp.leading).offset(-10)
            maker.centerY.equalToSuperview()
        }
        
        
        triangle.snp.makeConstraints({ maker in
            maker.trailing.equalTo(inputField.snp.trailing).offset(-5)
            maker.centerY.equalToSuperview()
        })
        
//        datePicker.snp.makeConstraints { maker in
//            maker.leading.trailing.bottom.equalToSuperview()
//            maker.height.equalToSuperview().dividedBy(3)
//        }
    }


    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
        inputField.text = selectedDate
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


