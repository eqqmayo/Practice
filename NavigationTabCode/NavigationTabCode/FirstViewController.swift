//
//  FirstViewController.swift
//  NavigationTabCode
//
//  Created by CaliaPark on 3/21/24.
//

import UIKit

class FirstViewController: UIViewController {

    var isLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
        
    }
    
    func makeUI() {
        view.backgroundColor = UIColor(hexCode: "f6e58d")
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        //appearance.backgroundColor = .brown     // 색상설정
        
        //appearance.configureWithTransparentBackground()  // 투명으로
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "즐겨찾기"
        
//        let navigationBarAppearance = UINavigationBarAppearance()
//        navigationBarAppearance.configureWithOpaqueBackground()
//        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
//        navigationController?.navigationBar.tintColor = .systemBlue
//
//        navigationItem.scrollEdgeAppearance = navigationBarAppearance
//        navigationItem.standardAppearance = navigationBarAppearance
//        navigationItem.compactAppearance = navigationBarAppearance
//
//        navigationController?.setNeedsStatusBarAppearanceUpdate()
//        
//        navigationController?.navigationBar.isTranslucent = false

//        title = "즐겨찾기"
    }
}
