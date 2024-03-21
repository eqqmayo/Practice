//
//  LoginViewController.swift
//  NavigationTabCode
//
//  Created by CaliaPark on 3/21/24.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(hexCode: "686de0")
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    func makeUI() {
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func loginButtonTapped() {
        
        if let presentingVC = presentingViewController { // 옵셔널 바인딩
            let tabBarCon = presentingVC as! UITabBarController   // 탭바에 접근하기
            let nav = tabBarCon.viewControllers?[0] as! UINavigationController  // 네비게이션바에 접근하기
            let firstVC = nav.viewControllers[0] as! FirstViewController  // FirstVC에 접근하기
            firstVC.isLoggedIn.toggle()  // 로그인 되었다고 상태 변화시키기 (실제 앱에서 이렇게 구현할 일은 없음)
        }
        
        dismiss(animated: true, completion: nil)
    }
    /*
    @objc func nextButtonTapped() {
        
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        let vc5 = FifthViewController()
        
        vc1.title = "즐겨찾기"
        vc2.title = "최근 통화"
        vc3.title = "연락처"
        vc4.title = "키패드"
        vc5.title = "음성 사서함"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        
        guard let items = tabBarVC.tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "star.fill")
        items[1].image = UIImage(systemName: "clock.fill")
        items[2].image = UIImage(systemName: "person.circle.fill")
        items[3].image = UIImage(systemName: "circle.grid.3x3.fill")
        items[4].image = UIImage(systemName: "recordingtape")
        
        present(tabBarVC, animated: true, completion: nil)
    }
    */

}

extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
