//
//  ViewController.swift
//  Facebook Feed
//
//  Created by Marco G. Turnip on 15/03/20.
//  Copyright © 2020 MGT. All rights reserved.
//

import UIKit

let cellId = "CellId"

class Post {
    var name: String?
    var profileImageName: String?
//    var localtion: Location?
    var statusText: String?
    var statusImageName: String?
    var numLikes: Int?
    var numComments: Int?
}

class Location: NSObject {
    var city: String?
    var state: String?
}

class FeedController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var posts = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let path = Bundle.main.path(forResource: "single_post", ofType: "json"){
//            do {
//                let datapost = try(NSData(contentsOfFile: path, options: NSData.ReadingOptions.dataReadingMapped))
//
//                let jsonDictionary = try(JSONSerialization.jsonObject(with: datapost as Data, options: .mutableContainers))
//
//                if jsonDictionary is [String: AnyObject] {
//                    let post = Post()
//                    post.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
//                    print(post.name, post.statusText)
//
//                }
//                print(jsonDictionary)
//            } catch let err {
//                print(err)
//            }
//        }
        
        let postMark = Post()
        postMark.name = "Mark Zuckerberg"
        postMark.profileImageName = "zuckprofile"
//        postMark.localtion = Location(city: "San Francisco", state: "CA")
        postMark.statusText = "Meanwhile, the dog have a good hair style. Awesome!"
        postMark.statusImageName = "zuckdog"
        postMark.numLikes = 400
        postMark.numComments = 233
        
        let postSteve = Post()
        postSteve.name = "Steve Jobs"
        postSteve.profileImageName = "stevejobs_profile"
//        postMark.localtion = Location(city: "San Francisco", state: "CA")
        postSteve.statusText = "Design is the fundamental soul of a human-made creation that ends up expressing itself in successive outer layers of the product or service. Design is not just what it looks like and how it feels. Design is how it works. You can't just ask customers what they want and then try to give that to them."
        postSteve.statusImageName = "stevejobs_status"
        postSteve.numLikes = 788
        postSteve.numComments = 982
        
        
        let postBill = Post()
        postBill.name = "Bill Gates"
        postBill.profileImageName = "billgates_profile"
//        postMark.localtion = Location(city: "San Francisco", state: "CA")
        postBill.statusText = "Success is a lousy teacher. It seduces smart people into thinking they can’t lose.\nIf you are born poor it’s not your mistake, but if you die poor it’s your mistake."
        postBill.statusImageName = "billgates_status"
        postSteve.numLikes = 788
        postSteve.numComments = 982
        
        posts.append(postMark)
        posts.append(postSteve)
        posts.append(postBill)
        
        navigationItem.title = "Facebook Feed"
        
        collectionView.alwaysBounceVertical = true  // bisa scrol be bawah atau ke atas
        
        collectionView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        
        // register cell id
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedCell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        
        feedCell.post = posts[indexPath.item]
        
        return feedCell
        
    }
    
    // membuat colom ke vertikal
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let statusText = posts[indexPath.item].statusText {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knowHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            
            return CGSize(width: view.frame.width, height: rect.height + knowHeight + 24)
        }
        
        return CGSize(width: view.frame.width, height: 500)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
}

class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            
            if let name = post?.name {
                let attributeText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
                
                attributeText.append(NSAttributedString(string: "\nDecember 18 • San Francisco •  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 5
                attributeText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributeText.length))
                
                let attachmentGlobe = NSTextAttachment()
                attachmentGlobe.image = UIImage(named: "globe_small")
                attachmentGlobe.bounds = CGRect(x: 2, y: -2, width: 12, height: 12)
                attributeText.append(NSAttributedString(attachment: attachmentGlobe))
                
                nameLabel.attributedText = attributeText
            }

            if let statusText = post?.statusText {
                statusTextView.text = statusText
            }
            if let profileImagename = post?.profileImageName {
                profileImageView.image = UIImage(named: profileImagename)
            }
            if let statusImagename = post?.statusImageName {
                statusImageView.image = UIImage(named: statusImagename)
            }
         }
        }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        
        return label
    }()
    
    let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckprofile")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Meanwhile, the dog have a good hair style. Awesome!"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        return textView
        
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckdog")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let likeCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "599 likes    12.7K Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 161)
        return label
    }()
    
    let devideLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    
    let likeButton = FeedCell.buttonForTiltle(title: "Like", imageName: "like")
    let commentButton: UIButton = FeedCell.buttonForTiltle(title: "Comment", imageName: "comment")
    let shareButton: UIButton = FeedCell.buttonForTiltle(title: "Share", imageName: "share")
    
    
    static func buttonForTiltle(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: .normal)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0  )
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }
    
//    func animate() {
//        let view = UIView()
//        view.backgroundColor = UIColor.red
//        view.frame = statusImageView.frame
//        addSubview(view)
//    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likeCommentsLabel)
        addSubview(devideLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
//        statusImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: FeedCell.animate))
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]", views: likeCommentsLabel)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: devideLineView)
        
        // button untuk like, comment dan share
        addConstraintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        
        // 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.8)][v5(44)]|", views: profileImageView, statusTextView, statusImageView, likeCommentsLabel, devideLineView, likeButton)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: commentButton)
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: shareButton)
    }
}


extension UIColor {
    static func rgb(red : CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, metrics: nil, views: viewDictionary))
    }
}

