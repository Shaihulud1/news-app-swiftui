//
//  ApiManager.swift
//  news-app-swiftui
//
//  Created by Илья Дернов on 11.11.2020.
//

import Foundation

class ApiManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func request() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(ApiData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                       
                    }

                } else {
                    print(error ?? "Unknown error while request")
                }
            }
            task.resume()
        }
    }
    
}
