//
//  ContentView.swift
//  AsyncImageApp
//
//  Created by marco rodriguez on 27/06/22.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://img.remediosdigitales.com/61a9ba/seat-ibiza-fr-20-aniversario-mexico-precio-/1366_2000.jpg"
    
    var body: some View {
        // MARK: - 1.- Basic
        
        //AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2.- Scale
        //AsyncImage(url: URL(string: imageURL), scale: 5.0)
        
        // MARK: - Placeholder
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 128)
                .foregroundColor(.purple)
                .opacity(0.5)
        }
        .padding(44)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
