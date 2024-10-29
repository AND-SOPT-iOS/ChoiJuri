//
//  App.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/26/24.
//

import UIKit

struct App {
    let iconImage: UIImage
    let ranking: Int
    let title: String
    let subTitle: String
    let category: String
    let downloadState: DownloadState
}


// 목데이터
extension App {
    static let mockData: [App] = [
        App(
            iconImage: .thumbnail,
            ranking: 1,
            title: "카카오톡",
            subTitle: "모든 연결의 시작",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 2,
            title: "에브리타임",
            subTitle: "함께하는 대학생활",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 3,
            title: "밴드-모임이 쉬워진다!",
            subTitle: "소모임, 챌린지, 스터디, 취미모임",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 4,
            title: "Lysn",
            subTitle: "최애와 나만의 프라이빗 메시지",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 5,
            title: "블라인드 Blind",
            subTitle: "모든 변화의 시작",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 6,
            title: "당근",
            subTitle: "당신 근처의 지역 생활 커뮤니티",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 7,
            title: "당근",
            subTitle: "당신 근처의 지역 생활 커뮤니티",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 8,
            title: "당근",
            subTitle: "당신 근처의 지역 생활 커뮤니티",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 9,
            title: "당근",
            subTitle: "당신 근처의 지역 생활 커뮤니티",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 10,
            title: "당근",
            subTitle: "당신 근처의 지역 생활 커뮤니티",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "questionmark")!,
            ranking: 11,
            title: "당근",
            subTitle: "당신 근처의 지역 생활 커뮤니티",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        
    ]
}

