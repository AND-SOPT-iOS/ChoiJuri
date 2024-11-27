//
//  App.swift
//  SoptSwiftUIPractice
//
//  Created by 최주리 on 11/23/24.
//

import SwiftUI

enum DownloadState: String {
    case installed = "열기"
    case download = "받기"
    case redownload = ""
    case update = "업데이트"
}

struct AppEntity: Identifiable {
    
    let id: UUID
    let iconImage: UIImage
    let ranking: Int
    let title: String
    let subTitle: String
    let category: String
    let downloadState: DownloadState
}

extension AppEntity {
    
    static let appList: [AppEntity] = [
        AppEntity(id: UUID(),
                  iconImage: .thumbnail,
                  ranking: 1,
                  title: "토스",
                  subTitle: "금융이 쉬워진다",
                  category: "금융",
                  downloadState: .installed),
        AppEntity(id: UUID(),
                  iconImage: .silson241,
                  ranking: 2,
                  title: "실손24",
                  subTitle: "간편한 실손보험 청구",
                  category: "금융",
                  downloadState: .installed),
        AppEntity(id: UUID(),
                  iconImage: .hyundaicard1,
                  ranking: 3,
                  title: "빗썸",
                  subTitle: "No.1 가상자산 플랫폼",
                  category: "금융",
                  downloadState: .download),
        AppEntity(id: UUID(),
                  iconImage: .naverpay,
                  ranking: 4,
                  title: "네이버페이",
                  subTitle: "지갑 없이 매장에서 결제",
                  category: "금융",
                  downloadState: .redownload),
        AppEntity(id: UUID(), iconImage: .kakaopay,
                  ranking: 5,
                  title: "카카오페이",
                  subTitle: "마음 놓고 금융하다",
                  category: "금융",
                  downloadState: .update),
        AppEntity(id: UUID(),
                  iconImage: .kbank1,
                  ranking: 6,
                  title: "KB스타뱅킹",
                  subTitle: "모바일신분증, 결제, 통신도 다 되는 은행",
                  category: "금융",
                  downloadState: .download),
        AppEntity(id: UUID(),
                  iconImage: .monimo,
                  ranking: 7,
                  title: "monimo (모니모, 삼성금융네트웍스)",
                  subTitle: "모이는 금융, 커지는 혜택! monimo 모니모",
                  category: "금융",
                  downloadState: .update),
        AppEntity(id: UUID(),
                  iconImage: .kbpay,
                  ranking: 8,
                  title: "KB Pay",
                  subTitle: "모든 금융을 한번에, 한손에, 한눈에 담다",
                  category: "금융",
                  downloadState: .installed),
        AppEntity(id: UUID(),
                  iconImage: .hyundaidepartment1,
                  ranking: 9,
                  title: "나무증권 - NH투자증권 MTS",
                  subTitle: "쉽고 편한 국내주식, 해외주식",
                  category: "금융",
                  downloadState: .redownload),
        AppEntity(id: UUID(),
                  iconImage: .kakaopay,
                  ranking: 10,
                  title: "NH올원뱅크",
                  subTitle: "금융",
                  category: "금융",
                  downloadState: .installed),
        AppEntity(id: UUID(),
                  iconImage: .naverpay,
                  ranking: 11,
                  title: "트래블월렛 - travel Pay",
                  subTitle: "페이에 세계를 담다",
                  category: "금융",
                  downloadState: .installed),
        
    ]
    
}
