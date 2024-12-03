//
//  TossDetailView.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 12/3/24.
//

import SwiftUI

struct TossDetailView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // header
                HStack {
                    Image(.thumbnail)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(.rect(cornerRadius: 20))
                    VStack(alignment: .leading) {
                        Text("토스")
                            .font(.system(size: 24, weight: .bold))
                        Text("금융이 쉬워진다")
                        Spacer()
                        HStack {
                            BlueButton(title: "열기", tapAction: {
                                
                            })
                            Spacer()
                            Button(action: {
                                print("공유하기")
                            }, label: {
                                Image(systemName: "square.and.arrow.up")
                            })
                        }
                    }
                }
                .padding(.vertical)
                
                Divider()
                
                ScrollView(.horizontal) {
                    HStack {
                        VStack {
                            Text("8.4만개의 평가")
                                .font(.system(size: 12))
                            Text("4.4")
                                .font(.system(size: 22))
                            Text("★★★★☆")
                                .font(.system(size: 14))
                        }
                        .frame(width: 100)
                        Divider()
                            .frame(height: 50)
                        VStack {
                            Text("수상")
                                .font(.system(size: 12))
                            Image(systemName: "person")
                                .font(.system(size: 22))
                            Text("앱")
                                .font(.system(size: 14))
                        }
                        .frame(width: 100)
                        Divider()
                            .frame(height: 50)
                        VStack {
                            Text("연령")
                                .font(.system(size: 12))
                            Text("4+")
                                .font(.system(size: 22))
                            Text("세")
                                .font(.system(size: 14))
                        }
                        .frame(width: 100)
                        Divider()
                            .frame(height: 50)
                        VStack {
                            Text("차트")
                                .font(.system(size: 12))
                            Text("#13")
                                .font(.system(size: 22))
                            Text("금융")
                                .font(.system(size: 14))
                        }
                        .frame(width: 100)
                        Divider()
                            .frame(height: 50)
                        VStack {
                            Text("개발자")
                                .font(.system(size: 12))
                            Image(systemName: "person.crop.square")
                                .font(.system(size: 22))
                            Text("Viva Republica")
                                .font(.system(size: 14))
                        }
                        .frame(width: 120)
                        Divider()
                            .frame(height: 50)
                        VStack {
                            Text("언어")
                                .font(.system(size: 12))
                            Text("KO")
                                .font(.system(size: 22))
                            Text("+ 1개 언어")
                                .font(.system(size: 14))
                        }
                        .frame(width: 100)
                    }
                    .padding()
                }
                .scrollIndicators(.hidden)
                
                Divider()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("새로운 소식")
                            .font(.system(size: 24, weight: .bold))
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.black)
                        })
                    }
                    HStack {
                        Text("버전 5.183.0")
                            .padding(.bottom, 10)
                        Spacer()
                        Text("5일 전")
                    }
                    Text("· 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.")
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("미리보기")
                        .font(.system(size: 24, weight: .bold))
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<5) { _ in
                                Image(.preview)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(.rect(cornerRadius: 20))
                                    .padding(10)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "iphone.rear.camera")
                        Text("iPhone")
                    }
                    .foregroundStyle(.gray)
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다.")
                    //TODO: 텍스트 누르면 더보기
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Viva Republica")
                                .foregroundStyle(.blue)
                            Text("개발자")
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black)
                    }
                    .padding(.vertical)
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("평가 및 리뷰")
                            .font(.system(size: 24, weight: .bold))
                        Button(action: {
                            print("모두 보기")
                        }, label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.black)
                        })
                    }
                    HStack {
                        Text("4.4")
                            .font(.system(size: 40, weight: .bold))
                            .padding(.leading, 10)
                        Spacer()
                        VStack {
                            Text("★★★★☆")
                            Text("8.4만개의 평가")
                        }
                    }
                    .padding(.bottom, 10)
                    
                }
                
                VStack(alignment: .leading) {
                    
                    Text("가장 도움이 되는 리뷰")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.leading, 10)
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal) {
                            HStack {
                                ReviewView(title: "와 토스는 진짜....", date: "12월 5일", writer: "주리", content: "구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.")
                                ReviewView(title: "와 토스는 진짜....", date: "12월 5일", writer: "주리", content: "구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.")
                                ReviewView(title: "와 토스는 진짜....", date: "12월 5일", writer: "주리", content: "구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.")
                                ReviewView(title: "와 토스는 진짜....", date: "12월 5일", writer: "주리", content: "구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.")
                                
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
            
                HStack {
                    Spacer()
                    VStack {
                        Text("탭하여 평가하기")
                            .font(.system(size: 20))
                        Text("☆ ☆ ☆ ☆ ☆")
                            .font(.system(size: 30))
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "square.and.pencil")
                            Text("리뷰 작성")
                        }
                        .padding()
                        .background(Color(uiColor: .systemGray5))
                        .clipShape(.rect(cornerRadius: 20))
                    })
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("앱 지원")
                        }
                        .padding()
                        .background(Color(uiColor: .systemGray5))
                        .clipShape(.rect(cornerRadius: 20))
                    })
                    Spacer()
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TossDetailView()
}
