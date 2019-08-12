//
//  WaterCoffeeViewController.swift
//  Dami
//
//  Created by Omid Tavanaei on 8/10/19.
//  Copyright © 2019 Omid Tavanaei. All rights reserved.
//

import UIKit
import HGCircularSlider

class WaterCoffeeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .red
        //navigationController?.navigationBar.tintColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationItem.backBarButtonItem?.title = "jljl"
        view.backgroundColor = UIColor(red:0.37, green:0.18, blue:0.08, alpha:1.0)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        backgroundImage.clipsToBounds = true
        setupViews()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    let backgroundImage: UIImageView = {
        var image: UIImage = UIImage(named: "background2")!
        let myImage = UIImageView(image: image)
        myImage.contentMode = .scaleAspectFill
        
        return myImage
    }()
    let cupImage: UIImageView = {
        var image: UIImage = UIImage(named: "cup")!
        let myImage = UIImageView(image: image)
        myImage.contentMode = .scaleAspectFill
        myImage.layer.shadowOpacity = 10
        myImage.layer.shadowColor = UIColor.white.cgColor
        myImage.translatesAutoresizingMaskIntoConstraints = false
       return myImage
    }()
    
    let waterSlider: CircularSlider = {
        let circularSlider = CircularSlider(frame: .zero)
        circularSlider.backgroundColor = .clear
        circularSlider.minimumValue = 0
        circularSlider.maximumValue = 410
        circularSlider.endThumbImage = UIImage(named: "drop")
        circularSlider.lineWidth = 10
        circularSlider.trackFillColor = UIColor(red:0.26, green:0.48, blue:0.70, alpha:1.0)
        circularSlider.diskFillColor = UIColor(red:0.40, green:0.73, blue:0.96, alpha:1.0)
        circularSlider.backtrackLineWidth = 0
        circularSlider.numberOfRounds = 1
        circularSlider.diskColor = .gray
        circularSlider.translatesAutoresizingMaskIntoConstraints = false
        return circularSlider
    }()
    let coffeeSlider: CircularSlider = {
        let circularSlider = CircularSlider(frame: .zero)
        circularSlider.backgroundColor = .clear
        circularSlider.minimumValue = 0
        circularSlider.maximumValue = 410
        circularSlider.endThumbImage = UIImage(named: "coffee")
        circularSlider.lineWidth = 10
        circularSlider.trackFillColor = UIColor(red:0.37, green:0.18, blue:0.08, alpha:1.0)
        circularSlider.diskFillColor = UIColor(red:0.30, green:0.18, blue:0.08, alpha:6.0)
        circularSlider.backtrackLineWidth = 0
        circularSlider.numberOfRounds = 1
        circularSlider.diskColor = .clear
        circularSlider.translatesAutoresizingMaskIntoConstraints = false
        return circularSlider
    }()
    let myTitle: UILabel = {
       let label = UILabel()
        label.text = "نحوه دم کردن انواع قهوه"
        label.textColor = .white
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.textAlignment = .right
        label.font = UIFont(name: "helvetica", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let headerTitle: UILabel = {
        let label = UILabel()
        label.text = "یه سری تایتل های متنوع"
        label.textColor = .white
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = .right
        label.font = UIFont(name: "helvetica", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "قهوه اینجوری ساخته میشه و فولان مثلا"
        label.textColor = .white
        label.backgroundColor = .clear
        label.numberOfLines = 4
        label.textAlignment = .right
        label.font = UIFont(name: "helvetica", size:  15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let doButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 5
        button.setTitle("Just Do it!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews(){
        view.addSubview(backgroundImage)
        view.addSubview(cupImage)
        view.addSubview(myTitle)
        view.addSubview(headerTitle)
        view.addSubview(descriptionLabel)
        view.addSubview(doButton)
        view.addSubview(waterSlider)
        view.addSubview(coffeeSlider)
        
        cupImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cupImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        cupImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cupImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        waterSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        waterSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        waterSlider.widthAnchor.constraint(equalToConstant: 265).isActive = true
        waterSlider.heightAnchor.constraint(equalToConstant: 265).isActive = true
        
        coffeeSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        coffeeSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        coffeeSlider.widthAnchor.constraint(equalToConstant: 150).isActive = true
        coffeeSlider.heightAnchor.constraint(equalToConstant: 150).isActive = true

        myTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        myTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        myTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        headerTitle.topAnchor.constraint(equalTo: waterSlider.bottomAnchor, constant: 20).isActive = true
        headerTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        headerTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: headerTitle.topAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        doButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        doButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        doButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        doButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }

}
