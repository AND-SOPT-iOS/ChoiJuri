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
            title: "토스",
            subTitle: "금융이 쉬워진다",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .silson241,
            ranking: 2,
            title: "실손24",
            subTitle: "간편한 실손보험 청구",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .hyundaicard1,
            ranking: 3,
            title: "빗썸",
            subTitle: "No.1 가상자산 플랫폼",
            category: "금융",
            downloadState: .download
        ),
        App(
            iconImage: .naverpay,
            ranking: 4,
            title: "네이버페이",
            subTitle: "지갑 없이 매장에서 결제",
            category: "금융",
            downloadState: .redownload
        ),
        App(
            iconImage: .kakaopay,
            ranking: 5,
            title: "카카오페이",
            subTitle: "마음 놓고 금융하다",
            category: "금융",
            downloadState: .update
        ),
        App(
            iconImage: .kbank1,
            ranking: 6,
            title: "KB스타뱅킹",
            subTitle: "모바일신분증, 결제, 통신도 다 되는 은행",
            category: "금융",
            downloadState: .download
        ),
        App(
            iconImage: .monimo,
            ranking: 7,
            title: "monimo (모니모, 삼성금융네트웍스)",
            subTitle: "모이는 금융, 커지는 혜택! monimo 모니모",
            category: "금융",
            downloadState: .update
        ),
        App(
            iconImage: .kbpay,
            ranking: 8,
            title: "KB Pay",
            subTitle: "모든 금융을 한번에, 한손에, 한눈에 담다",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .hyundaidepartment1,
            ranking: 9,
            title: "나무증권 - NH투자증권 MTS",
            subTitle: "쉽고 편한 국내주식, 해외주식",
            category: "금융",
            downloadState: .redownload
        ),
        App(
            iconImage: .kakaopay,
            ranking: 10,
            title: "NH올원뱅크",
            subTitle: "금융",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .naverpay,
            ranking: 11,
            title: "트래블월렛 - travel Pay",
            subTitle: "페이에 세계를 담다",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .kbank1,
            ranking: 12,
            title: "케이뱅크 (Kbank)",
            subTitle: "make money",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .kakaobank1,
            ranking: 13,
            title: "카카오뱅크",
            subTitle: "이미 모두의 은행",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .toss1,
            ranking: 14,
            title: "V3 Mobile Plus",
            subTitle: "코스콤 통합인증 / 알림장 메시지 서비스",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .hyundaicard1,
            ranking: 15,
            title: "현대카드",
            subTitle: "금융",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .mobileTmoney,
            ranking: 16,
            title: "모바일티머니",
            subTitle: "금융",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .kbpay,
            ranking: 17,
            title: "빗썸",
            subTitle: "No.1 가상자산 플랫폼",
            category: "금융",
            downloadState: .installed
        ),App(
            iconImage: .monimo,
            ranking: 18,
            title: "NH스마트뱅킹",
            subTitle: "한번에 편하게!",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .pass,
            ranking: 19,
            title: "PASS by SKT",
            subTitle: "인증을 넘어 일상으로 PASS",
            category: "금융",
            downloadState: .installed
        ),
        App(
            iconImage: .silson241,
            ranking: 20,
            title: "우리 WON 뱅킹",
            subTitle: "금융",
            category: "금융",
            downloadState: .installed
        ),
    ]
}

