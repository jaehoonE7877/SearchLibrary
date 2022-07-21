//
//  TopSearchViewController.swift
//  SearchLibrary
//
//  Created by Seo Jae Hoon on 2022/07/21.
//

import UIKit

class TopSearchViewController: UIViewController {

    
    static let identifier = "TopSearchViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "검색하세요"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        
    }
    
    
    @objc
    func closeButtonTapped(){
        self.dismiss(animated: true)
    }

    

}
