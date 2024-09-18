//
//  XFSubscribeCenter.swift
//  XFSwiftDemo
//
//  Created by Aron.Li on 2024/9/13.
//

import Foundation


class XFSubscribeCenter {
    static let defaultCenter = XFSubscribeCenter()
    
    private var buryConfigArray = [String]()
    
    init() {
        addNotificationObserver()
        createBuryData()
    }
    
    // 删除观察者
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // 添加观察者
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.onburyEventControl(_:)), name: .BuryEventControl, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.onburyEventPage(_:)), name: .BuryEventPage, object: nil)
    }
    
    public func fetchDynamicEvent() {
        // TODO: 网络请求拉取配置表
        
    }
}

extension XFSubscribeCenter {
    @objc func onburyEventControl(_ notification: Notification) {
        print("接收通知的线程--==--==%@", Thread.current)
        if let data = notification.userInfo?["buryId"] as? String {
            print("收到通知，携带数据: \(data)")
            onMatchEvent(with: data)
        }
    }
    
    @objc func onburyEventPage(_ notification: Notification) {
        if let data = notification.userInfo?["buryId"] as? String {
            print("收到通知，携带数据: \(data)")
            
        }
    }
}

extension XFSubscribeCenter {
    private func onMatchEvent(with buryId: String) {
        let _ = onForIn(with: buryId)
        let _ = onWhile(with: buryId)
        let _ = onFilter(with: buryId)
    }
    
    private func createBuryData() {
        let arrayCount = 10000
        var array: [String] = Array(repeating: "", count: arrayCount)
        for i in 0..<array.count {
            array[i] = "tap_ViewController_UIButton\(i)"
        }
        self.buryConfigArray = array
    }
}

extension XFSubscribeCenter {
    private func onForIn(with buryId: String) -> Bool {
        var isExist = false
        let t1 = Date()
        for configId in self.buryConfigArray {
            if configId == buryId {
                isExist = true
            }
        }
        let t2 = Date()
        print("=-=-=-ForIn time = \(t2.timeIntervalSince(t1))")
        return isExist
    }
    
    private func onWhile(with buryId: String) -> Bool {
        let t1 = Date()
        var i = 0
        while buryId != self.buryConfigArray[i] {
            i += 1
        }
        let t2 = Date()
        print("=-=-=-While time = \(t2.timeIntervalSince(t1))")
        return i != self.buryConfigArray.count-1
    }
    
    private func onFilter(with buryId: String) -> Bool {
        let t1 = Date()
        let result = self.buryConfigArray.filter({ $0 == buryId }).first
        let t2 = Date()
        print("=-=-=- Filter time = \(t2.timeIntervalSince(t1))")
        return result != nil
    }
}
