//
//  DataLoadOperation.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

class DataLoadOperation: AsyncOperation {

    var completion: ((Data?, URLResponse?, Error?) -> ())?
    var dataTask: URLSessionDataTask!
    let request: URLRequest
    let session: URLSession
    
    init(url: URL, session: URLSession) {
        request = URLRequest(url: url)
        self.session = session
        super.init()
    }
    
    override func main() {
        guard !isCancelled else {
            state = .isFinished
            return
        }
        
        dataTask = session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            if let strongSelf = self, !strongSelf.isCancelled {
                guard error == nil else {
                    strongSelf.completion?(nil, response, error)
                    strongSelf.state = .isFinished
                    return
                }
                
                strongSelf.completion?(data, response, nil)
                strongSelf.state = .isFinished
            }
        })
        dataTask.resume()
    }
    
    override func cancel() {
        dataTask.cancel()
        super.cancel()
    }
    
}
