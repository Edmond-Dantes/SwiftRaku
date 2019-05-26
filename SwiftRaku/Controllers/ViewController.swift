//
//  ViewController.swift
//  SwiftRaku
//
//  Created by Edmond on 2019/05/26.
//  Copyright © 2019 Edmond. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = UIScreen.main.bounds
        view.backgroundColor = UIColor.primary
        let text = UITextField(frame: frame)
        view.addSubview(text)
        let session = URLSession.shared
        let genreId = 100227
        let applicationId = ProcessInfo.processInfo.environment["APPLICATION_ID"]!
        let url = URL(string: "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?format=json&genreId=\(genreId)&applicationId=\(applicationId)")!
        let task = session.dataTask(with: url, completionHandler:{ data, response, error in
            DispatchQueue.main.async {
                if let d = data, let dataString = String(data: d, encoding: .utf8) {
                    print(dataString)
                    text.text = dataString
                }
                if let r = response {
                    print(r)
                }
                if let e = error {
                    print(e)
                }
            }
        })

        task.resume()
    }

}

