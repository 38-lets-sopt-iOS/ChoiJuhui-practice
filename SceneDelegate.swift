//
//  SceneDelegate.swift
//  Sopt38-Seminar
//
//  Created by h2e on 4/10/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // UIWindowScene 앱의 윈도우와 뷰를 관리하는 핵심 객체
        // scene이 UIWindowScene이 아니라면 실행을 중단
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
//        let loginViewController = LoginViewController_SnapKit()
//        let AutoLayoutViewController = Autolayout_Practice()
        let ScrollViewController = ScrollViewPractice2()
        let navigationController = UINavigationController(rootViewController: ScrollViewController)
        
        // window의 루트를 설정.
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController // 네비게이션 컨트롤러를 루트뷰로 설정
        
        // window를 가장 중요한 key 윈도우로 설정하고 사용자에게 보이게 만듦. (Visible)
        window.makeKeyAndVisible()
        
        // SceneDelegate의 window 속성에 방금 만든 window를 할당.
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

