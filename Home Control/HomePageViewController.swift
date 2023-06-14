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

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple

        
    }
}
