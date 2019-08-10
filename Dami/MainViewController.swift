//
//  ViewController.swift
//  Dami
//
//  Created by Omid Tavanaei on 8/9/19.
//  Copyright © 2019 Omid Tavanaei. All rights reserved.
//

import UIKit
import FSPagerView

class MainViewController: UIViewController,FSPagerViewDelegate, FSPagerViewDataSource {
   
    fileprivate let imageNames = ["cafe1.jpg","cafe2.jpg","cafe3.jpg"]
    fileprivate let labels = ["کسشر محض","قهوه سوخته","قهوه‌ی کسشر"]
    fileprivate var numberOfItems = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupView()
        pager.dataSource = self
        pager.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    let pager: FSPagerView = {
        let pagerView = FSPagerView(frame: .zero)
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        //pagerView.itemSize = FSPagerView.automaticSize
        pagerView.itemSize = CGSize(width: 370 , height: 550)
        pagerView.transformer = FSPagerViewTransformer(type: .overlap)
        pagerView.backgroundColor = .clear
        pagerView.translatesAutoresizingMaskIntoConstraints = false
         return pagerView
    }()
    
    let controller: FSPageControl = {
        let pageControl = FSPageControl(frame: .zero)
        pageControl.numberOfPages = 3
        pageControl.contentHorizontalAlignment = .left
        pageControl.contentInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        pageControl.backgroundColor = .red
        pageControl.layer.borderColor = UIColor.gray.cgColor
        pageControl.layer.borderWidth = 0.5
        pageControl.translatesAutoresizingMaskIntoConstraints = false
         return pageControl
    }()
   
    func setupView(){

        view.addSubview(pager)
        view.addSubview(controller)
        
        pager.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pager.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        pager.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        controller.bottomAnchor.constraint(equalTo: pager.bottomAnchor, constant: 20).isActive = true
        controller.centerXAnchor.constraint(equalTo: pager.centerXAnchor).isActive = true
        controller.heightAnchor.constraint(equalToConstant: 20).isActive = true
        controller.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.numberOfItems
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.textLabel?.text = self.labels[index]
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 30)
        cell.contentMode = .scaleAspectFit
        cell.imageView?.clipsToBounds = true

        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        controller.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        controller.currentPage = pagerView.currentIndex
    }
    

}


