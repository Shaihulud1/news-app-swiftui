//
//  ContentView.swift
//  news-app-swiftui
//
//  Created by Илья Дернов on 11.11.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var apiManager = ApiManager()
    
    var body: some View {
        NavigationView {
            List(apiManager.posts, rowContent: { post in
                    NavigationLink(
                        destination: DetailView(url: post.url)
                    ) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                        .foregroundColor(.black)
                    }

                
            })
            .navigationBarTitle("News")
        }
        .onAppear(perform: {
            self.apiManager.request()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



