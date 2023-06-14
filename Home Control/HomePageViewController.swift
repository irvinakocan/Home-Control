//
//  HomePageViewController.swift
//  Home Control
//
//  Created by Macbook Air 2017 on 13. 6. 2023..
//

import UIKit

let room: [[String: Any]] = [
    [
        "room": "Pantry",
        "image": "pantry"
    ],
    [
        "room": "Living Room",
        "image": "livingRoom"
    ],
    [
        "room": "Spare Room",
        "image": "spareRoom"
    ],
    [
        "room": "Games Room",
        "image": "gameRoom"
    ],
    [
        "room": "Dining Room",
        "image": "diningRoom"
    ],
    [
        "room": "Library",
        "image": "library"
    ]
]

class HomePageViewController: UIViewController, TaskViewDelegate {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var taskStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home Control"
        view.backgroundColor = .white

        addRightButton()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(taskStackView)
        taskStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        taskStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        taskStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        taskStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        taskStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func addRightButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addMoreView))
    }
    
    @objc func addMoreView() {
        let view = TaskView(delegate: self,data: room[Int.random(in: 0..<room.count)])
        taskStackView.addArrangedSubview(view)
    }
    
    func onRemove(_ view: TaskView) {
        UIView.animate(withDuration: 0.3, animations: {
            self.taskStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        })
    }
}
