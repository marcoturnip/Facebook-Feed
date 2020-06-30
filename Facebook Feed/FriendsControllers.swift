//
//  FriendsControllers.swift
//  Facebook Feed
//
//  Created by Marco G. Turnip on 16/03/20.
//  Copyright © 2020 MGT. All rights reserved.
//

import UIKit

class FriendsController: UITableViewController {
    
    static let cellId = "cellId"
    static let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Friends"
        
        tableView.separatorColor = UIColor.rgb(red: 299, green: 231, blue: 235)
        tableView.sectionHeaderHeight = 26
        
        tableView.register(FriendCell.self, forCellReuseIdentifier: FriendsController.cellId)
        tableView.register(RequestHeader.self, forHeaderFooterViewReuseIdentifier: FriendsController.headerId)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsController.cellId, for: indexPath as IndexPath) as! FriendCell
        
        if indexPath.row % 3 == 0 {
            cell.namelabel.text = "Mark Zuckerberg"
            cell.requestImageView.image = UIImage(named: "zuckprofile")
        } else if indexPath.row % 3 == 1 {
            cell.namelabel.text = "Steve Jobs"
            cell.requestImageView.image = UIImage(named: "stevejobs_profile")
        } else {
            cell.namelabel.text = "Bill Gates"
            cell.requestImageView.image = UIImage(named: "billgates_profile")
        }
        
//       cell.backgroundColor = UIColor.red
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendsController.headerId) as! RequestHeader
        
        if section == 0 {
            header.nameLabel.text = "FRIENDS REQUEST"
        } else {
            header.nameLabel.text = "PEOPLE YOU MAY KNOW"
        }
        return header
    }
}

class RequestHeader: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Friend Requests"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(white: 0.4, alpha: 1)
        return label
    }()
    
    let bottomBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235)
        return view
    }()
    
    func setupViews(){
        addSubview(nameLabel)
        addSubview(bottomBorderView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: nameLabel)
        
        addConstraintsWithFormat(format: "V:|[v0][v1(0.5)]|", views: nameLabel, bottomBorderView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: bottomBorderView)
    }
}

class FriendCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let namelabel: UILabel = {
        let label = UILabel()
        label.text = "Sampel Name"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let requestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.blue
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.rgb(red: 87, green: 143, blue: 255)
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(UIColor(white: 0.3, alpha: 1), for: .normal)
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        return button
    }()
    
    func setupViews() {
        addSubview(namelabel)
        addSubview(requestImageView)
        addSubview(confirmButton)
        addSubview(deleteButton)
        
        
        addConstraintsWithFormat(format: "H:|-16-[v0(52)]-8-[v1]|", views: requestImageView, namelabel)
        
        addConstraintsWithFormat(format: "V:|-4-[v0]-4-|", views: requestImageView)
        
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-[v1(24)]-8-|", views: namelabel, confirmButton)
        
        addConstraintsWithFormat(format: "H:|-76-[v0(80)]-8-[v1(80)]", views: confirmButton, deleteButton)
        
        addConstraintsWithFormat(format: "V:[v0(24)]-8-|", views: deleteButton)
        
    }
    
    
}

