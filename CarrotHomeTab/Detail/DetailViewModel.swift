//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by Songhee Choi on 2022/07/25.
//

import Foundation
import Combine

// - []
// itemInfo -> 서버,, postId 로 상세 정보 줘라~~


final class DetailViewModel {
    
    let network: NetworkService
    let itemInfo: ItemInfo
    
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    
    init(network: NetworkService, itemInfo: ItemInfo) {
        self.network = network
        self.itemInfo = itemInfo
    }
    
    func fetch() {
        
        // api없어서 가짜데이터 만듦
        DispatchQueue.global().asyncAfter(deadline: .now()+1.5) { [unowned self] in 
            self.itemInfoDetails = ItemInfoDetails(user: User.mock, item: self.itemInfo, details: ItemExtraInfo.mock)
            
        }
        
        
        
//        // --> 원래 이렇게 정의 해야함
//        let resource: Resource<ItemInfoDetails> = Resource(
//            base: <#T##String#>,
//            path: <#T##String#>,
//            params: [:],
//            header: [:]
//        )
//        network.load(resource)
//            .receive(on: RunLoop.main)
//            .sink(receiveValue: <#T##((Publishers.ReceiveOn<AnyPublisher<_, Error>, RunLoop>.Output) -> Void)##((Publishers.ReceiveOn<AnyPublisher<_, Error>, RunLoop>.Output) -> Void)##(Publishers.ReceiveOn<AnyPublisher<_, Error>, RunLoop>.Output) -> Void#>)
    }
}
