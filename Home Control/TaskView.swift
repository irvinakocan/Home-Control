//
//  TaskView.swift
//  Home Control
//
//  Created by Macbook Air 2017 on 13. 6. 2023..
//

import Foundation
import UIKit

protocol TaskViewDelegate {
    func onRemove(_ view: TaskView)
}

class TaskView: UIView {
    let data: [String: Any]
    
    let delegate: TaskViewDelegate
    
    lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.text = data["room"] as? String ?? ""
        return label
    }()
    
    lazy var btnShow: UIButton = {
        let button = UIButton()
        button.setTitle("Hide", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(btnShowTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.addArrangedSubview(lblTitle)
        stack.addArrangedSubview(btnShow)
        let constraint = stack.heightAnchor.constraint(equalToConstant: 30)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
        return stack
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10.0
        let constraint = view.heightAnchor.constraint(equalToConstant: 300)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
        view.contentMode = .scaleToFill
        view.image = UIImage(named: data["image"] as? String ?? "")
        return view
    }()
    
    lazy var btnRemove: UIButton = {
        let btn = UIButton()
        btn.setTitle("Remove", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.red.cgColor
        let constraint = btn.heightAnchor.constraint(equalToConstant: 30)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
        btn.addTarget(self, action: #selector(btnRemoveTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fill
        stack.addArrangedSubview(horizontalStackView)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(btnRemove)
        return stack
    }()
    
    init(delegate: TaskViewDelegate, data: [String: Any]) {
        self.data = data
        self.delegate = delegate
        super.init(frame: .zero)
        backgroundColor = .lightGray
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnShowTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            self.imageView.isHidden = !self.imageView.isHidden
        })
        
        if self.imageView.isHidden {
            btnShow.setTitle("Show", for: .normal)
        }
        else {
            btnShow.setTitle("Hide", for: .normal)
        }
    }
    
    @objc func btnRemoveTapped() {
        delegate.onRemove(self)
    }
}
