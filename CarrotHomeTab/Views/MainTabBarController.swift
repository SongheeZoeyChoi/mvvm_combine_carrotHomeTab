//
//  MainTabBarController.swift
//  CarrotHomeTab
//
//  Created by Songhee Choi on 2022/07/25.
//

import UIKit

// [o] 탭이 눌릴때마다, 그에 맞는 네비게이션 바를 구성하고 싶어요
// - [o] 탭이 눌리는 것을 감지
// - [o] 감지 후에, 그 탭에 맞게 네비게이션 바 구성을 업데이트 해줘야겠다.

// 앱이 시작할 때, 네비게이션 바 아이템 설정을 완료하고 싶다.
// - 네비게이션 바를
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Hello", style: .plain, target: nil, action: nil)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil) // 이미지 바 버튼: barButtonSystemItem
// 커스텀 바 버튼 : 인터렉션 되는 바버튼을 구성해보자 --> CustomBarItem
        
        delegate = self
        
        // 선택된 탭 업데이트 해주기
        //--> viewDidLoad 시점에는 selectedViewController 이건 nil 임.
        // 보여주기 직전인 viewWillAppear 에는 nil이 아니라서 viewWillAppear에 넣어줌
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 탭바 컨트롤러가 보여주기 직전에
        // self.selectedViewController //--> 이건 nil 임. 보여주기 직전에는 nil이 아니라서 viewWillAppear에 넣어줌
        updateNavigationItem(vc: self.selectedViewController!)
       
    }
    
    // 각 탭 별로 업데이트 해주기
    private func updateNavigationItem(vc: UIViewController) {
        switch vc {
        case is HomeViewController:
//            let titleItem = UIBarButtonItem(title: "정자동", style: .plain, target: nil, action: nil)
            // ===>
            let titleConfig = CustomBarItemConfiguration(title: "정자동", handler: {})
//            let customTitleView = CustomBarItem(config: titleConfig)
//            let titleItem = UIBarButtonItem(customView: customTitleView)
            // ===>
            let titleItem = UIBarButtonItem.generate(with: titleConfig)

//            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
// ===>
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "magnifyingglass"),
                handler: { print("--> search tapped") }
            )
//            let searchView = CustomBarItem(config: searchConfig)
//            // 바버튼의 크기 조절
//            NSLayoutConstraint.activate([
//                searchView.widthAnchor.constraint(equalToConstant: 30 )
//            ])
//            let searchItem = UIBarButtonItem(customView: searchView)
// ===>
            let searchItem = UIBarButtonItem.generate(with: searchConfig, width: 30)
             
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print("--> feed tapped") }
            )
//            let feedView = CustomBarItem(config: feedConfig)
//            NSLayoutConstraint.activate([
//                feedView.widthAnchor.constraint(equalToConstant: 30 )
//            ])
//            let feedItem = UIBarButtonItem(customView: feedView)
// ===>
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
//            navigationItem.leftBarButtonItem = titleItem
//            navigationItem.rightBarButtonItem = feedItem
// ===>
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem, searchItem]
            navigationItem.backButtonDisplayMode = .minimal // back버튼에서 title없애고 이모티콘만 나오게 함 
        case is MyTownViewController:
//            let titleItem = UIBarButtonItem(title: "정자동", style: .plain, target: nil, action: nil)
//            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
//            navigationItem.leftBarButtonItem = titleItem
//            navigationItem.rightBarButtonItem = feedItem
            
            let titleConfig = CustomBarItemConfiguration(title: "정자동", handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print("--> feed tapped") }
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            navigationItem.backButtonDisplayMode = .minimal
        case is ChatViewController:
            let titleConfig = CustomBarItemConfiguration(title: "채팅", handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print("--> feed tapped") }
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            navigationItem.backButtonDisplayMode = .minimal
        case is MyProfileViewController:
            let titleConfig = CustomBarItemConfiguration(title: "나의 당근", handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)

            let settingConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "gearshape"),
                handler: { print("--> search tapped") }
            )
            let settingItem = UIBarButtonItem.generate(with: settingConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [settingItem]
            navigationItem.backButtonDisplayMode = .minimal
        default:
            let titleConfig = CustomBarItemConfiguration(title: "정자동", handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = []
            navigationItem.backButtonDisplayMode = .minimal
            
        }
    }
}

// [o]각 탭에 맞게 네비게이션바 아이템 구성하기
// - 홈: 타이틀, 피드, 서치
// - 동네활동: 타이틀, 피드
// - 내 근처: 타이틀, 피드
// - 동네활동: 타이틀
// - 채팅: 타이틀, 피드
// - 나의 당근: 타이틀, 설정
extension MainTabBarController: UITabBarControllerDelegate {
    // 어떤 뷰 컨트롤러가 선택됐는지 알 수 있음 : didSelect
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("어떤 \(viewController)")
        updateNavigationItem(vc: viewController)
    }
}
