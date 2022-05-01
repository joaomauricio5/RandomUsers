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
        ScrollView{
            Text(userData.users)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
