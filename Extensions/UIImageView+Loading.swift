//
//  UIImageView+Loading.swift
//  GCCoreQuiz
//
//  Created by Roksana Markhyvka on 19.01.2021.
//  Copyright © 2021 Good & Co. All rights reserved.
//

import Foundation
import Alamofire // with Alamofire prior to version 5.0

extension UIImageView {
    func loadProfileImage(_ urlString: String?) {
        image = UIImage(named: "user_default_avatar")

        guard let urlString = urlString, urlString.isNotBlank,
              let url = URL(string: urlString)  else { return }

        sendGETImageData(from: url) { [weak self] (image) in
            self?.image = image
        }
    }

    private func sendGETImageData(from imageURL: URL, completion: @escaping (UIImage?) -> Void) {
        Alamofire.request(imageURL, method: .get).responseData(completionHandler: { (response) in
            if let imageData = response.data {
                completion(UIImage(data: imageData))
            } else {
                completion(nil)
            }
        })
    }
}
