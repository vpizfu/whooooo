//
//  ThumbStorage.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation


class ThumbStorage {

    static let shared = ThumbStorage()

    private var cache: NSCache<NSString, NSData>
    private let fetchQueue = OperationQueue()
    private let serialQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    private var handlers: Array<Dictionary<String,(Data) -> ()>>
    
    init() {
        cache = NSCache()
        handlers = Array()
        
    }

    func fetchAsyncOnURL(_ url: URL, completion: @escaping (Data) -> ()) {
        self.serialQueue.addOperation {
            self.handlers.append([url.absoluteString:completion])
            
            if let probablyCached = self.thumbForURL(url.absoluteString) as Data? {
                self.resolveAllHandlersForURL(url.absoluteString, image: probablyCached)
            } else {
                let operation = DataLoadOperation(url: url, session: URLSession.shared)
                operation.completion = { [weak self] data, response, error in
                    if let strongSelf = self {
                        guard let data = data, error == nil else {
                            print(error.debugDescription)
                            return
                        }
                        strongSelf.cache .setObject(NSData(data: data), forKey: NSString(string: url.absoluteString))
                        strongSelf.serialQueue.addOperation {
                            strongSelf.resolveAllHandlersForURL(url.absoluteString, image: data)
                        }
                    }
                }
                self.fetchQueue.addOperation(operation)
            }
        }
    }
    
    private func thumbForURL(_ url: String) -> NSData? {
        return cache.object(forKey: NSString(string: url))
    }
    
    private func resolveAllHandlersForURL(_ url: String, image: Data) {
        handlers.forEach { item in
            item[url]?(image)
        }
    }
}
