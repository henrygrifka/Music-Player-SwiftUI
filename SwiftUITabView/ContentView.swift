//
//  ContentView.swift
//  SwiftUITabView
//
//  Created by Simon Ng on 19/7/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var searchTypes = ["Playlists", "Artists", "Albums", "Songs", "Genres"]
    
    var body: some View {
        NavigationStack {
            
            TabView(selection: $selection) {
                
                List(searchTypes, id: \.self) { string in
                    NavigationLink(
                        destination: Text("\(string) Details"),
                        label: {
                            Text("\(string)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        })
                    
                }
                .listStyle(.plain)
                
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
                
                Text("Bookmark Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "music.note.list")
                        Text("My Music")
                    }
                    .tag(1)
                
                Text("Video Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("Queue")
                    }
                    .tag(2)

                Text("Profile Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("Settings")
                    }
                    .tag(3)
            }
            .tint(.red)
            
            .navigationTitle("Library")
//            .navigationBarHidden(true)
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Toggle(isOn: .constant(true)) {Text("Favorites")
                    }.toggleStyle(.switch)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
