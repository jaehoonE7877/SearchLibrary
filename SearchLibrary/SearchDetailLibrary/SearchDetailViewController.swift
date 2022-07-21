//
//  SearchDetailViewController.swift
//  SearchLibrary
//
//  Created by Seo Jae Hoon on 2022/07/21.
//

import UIKit

class SearchDetailViewController: UIViewController {

    static let identifier = "SearchDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "웹으로 검색할까요"
        
        navigationItem.backButtonTitle = ""
    }
    
    
    
    @IBAction func webButtonTapped(_ sender: UIButton) {
        
        
        let sb = UIStoryboard(name: "SearchDetailLibrary", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: WebScreenViewController.identifier)
                
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
