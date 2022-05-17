//
//  ContentView.swift
//  RandomUsers
//
//  Created by Joao Mauricio on 01/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userData = UserData()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    List(userData.users) { user in
                        HStack {
                            AsyncImage(url: URL(string: user.pictureURL)) { image in
                                image.clipShape(Circle())
                                    .shadow(radius: 3.0)
                            } placeholder: {
                                Image(systemName: "person")
                            }
                            .frame(width: 80, height: 80, alignment: .center)
                            .padding(.trailing, 10)
                            
                            Text(user.fullName)
                        }.onAppear {
                            if user == userData.users.last {
                                Task {
                                    await userData.loadUsers()
                                }
                            }
                        }
                    }
                    Button(action: {
                        Task{await userData.loadUsers()}
                    }) {
                        HStack {
                            Spacer()
                            
                            Text("Add more users...")
                                .bold()
                                .padding(.vertical)
                                
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Random Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
