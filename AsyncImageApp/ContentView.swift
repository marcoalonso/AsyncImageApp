//
//  ContentView.swift
//  AsyncImageApp
//
//  Created by marco rodriguez on 27/06/22.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self.imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://img.remediosdigitales.com/61a9ba/seat-ibiza-fr-20-aniversario-mexico-precio-/1366_2000.jp"
    
    var body: some View {
        // MARK: - 1.- Basic
        
        //AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2.- Scale
        //AsyncImage(url: URL(string: imageURL), scale: 5.0)
        
        // MARK: - Placeholder
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image.imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        }
//        .padding(44)
        
        // MARK: - 4.- Phase
        AsyncImage(url: URL(string: imageURL)) { phase in
            //Success: The image succesfully loaded.
            //Failure: The image failed to load with an error.
            //Empty: No image is loaded.
            
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "xmark.app.fill").iconModifier()
            } else {
                Image(systemName: "photo.circle.fill").iconModifier()
            }
            
        }
        .padding(44)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
