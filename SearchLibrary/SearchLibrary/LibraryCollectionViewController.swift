//
//  LibraryCollectionViewController.swift
//  SearchLibrary
//
//  Created by Seo Jae Hoon on 2022/07/20.
//

import UIKit


class LibraryCollectionViewController: UICollectionViewController {

    let movieList = MovieInfo()
    let cellBackGroundColor: [UIColor] = [.systemPurple, .systemPink, .systemOrange, .systemMint, .cyan, .green, .systemGray2, .magenta]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "영화 찾기"

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(magnifyButtonTapped))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: self, action: #selector(backButtonTapped) )
        
        let layout = UICollectionViewFlowLayout()
        // 나는 width를 이제 cell 한개의 너비로 설정할 거기 때문에 spacing 다 고려해줘야함
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
        
        
    }

    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc
    func magnifyButtonTapped() {
        
        let sb = UIStoryboard(name: "TopSearchLibrary", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: TopSearchViewController.identifier) as! TopSearchViewController
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        
        self.present(nav, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCollectionViewCell", for: indexPath) as! LibraryCollectionViewCell
        
        
        cell.backgroundColor = cellBackGroundColor[Int.random(in: 0...6)].withAlphaComponent(0.7)
        cell.layer.cornerRadius = 8
        
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "SearchDetailLibrary", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: SearchDetailViewController.identifier)
                
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
}




/*
 
 card layout 잡는 순서 정리
 1. 상수에 UICollectionViewFlowLayout() 인스턴스 생서
 2. cell 의 너비, 높이, spacing 정하기
 UIScreen.main.bounds.width : 디바이스의 가로 너비
 3. scroll 방향 설정
 4. section 간격 -> sectionInset 으로 설정 (UIEdgeInset 구조체 사용)
 5. 셀의 최소간격 정해주기(셀마다 크기가 다른 collection view가 있기 때문) -> mini로 시작하는 메서드 2개
 6. collectionView.collectionViewLayout 에게 위에 선언해준 상수로 레이아웃을 설정할 거라고 말해주기
 */

// 줄거리 보여주기 alert
