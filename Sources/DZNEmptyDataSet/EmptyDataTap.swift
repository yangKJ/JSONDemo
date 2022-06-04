//
//  EmptyDataTap.swift
//  Rickenbacker
//
//  Created by Condy on 2021/10/4.
//

import RxSwift
import RxCocoa

/// 空数据点击绑定事件
public protocol EmptyDataTap {
    /// 点击事件响应
    var emptyDataSetButtonTap: PublishSubject<Void> { get set }
    var emptyDataSetViewTap: PublishSubject<Void> { get set }
}

fileprivate var EmptyDataSetButtonTapContext: UInt8 = 0
fileprivate var EmptyDataSetViewTapContext: UInt8 = 0

extension EmptyDataTap {
    
    public var emptyDataSetButtonTap: PublishSubject<Void> {
        get {
            if let emptyData = objc_getAssociatedObject(self, &EmptyDataSetButtonTapContext) {
                return emptyData as! PublishSubject<Void>
            } else {
                let emptyData: PublishSubject<Void> = PublishSubject<Void>()
                objc_setAssociatedObject(self, &EmptyDataSetButtonTapContext, emptyData, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return emptyData
            }
        }
        set {
            objc_setAssociatedObject(self, &EmptyDataSetButtonTapContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var emptyDataSetViewTap: PublishSubject<Void> {
        get {
            if let emptyData = objc_getAssociatedObject(self, &EmptyDataSetViewTapContext) {
                return emptyData as! PublishSubject<Void>
            } else {
                let emptyData: PublishSubject<Void> = PublishSubject<Void>()
                objc_setAssociatedObject(self, &EmptyDataSetViewTapContext, emptyData, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return emptyData
            }
        }
        set {
            objc_setAssociatedObject(self, &EmptyDataSetViewTapContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
