//
//  AsyncImageView.swift
//  BigBurger
//
//  Created by Roland Lariotte on 09/09/2022.
//

import SwiftUI

/// Image Loading view with a placeholder when
/// being fetched and an error image if no data.
struct AsyncImageView: View {

  var imageURL: String

  var body: some View {
    AsyncImage(url: URL(string: imageURL)!) { phase in
      ZStack {
        if let image = phase.image {
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
        } else {
          Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .foregroundColor(.accentColor)
        }
      }
    }
    .frame(width: 108, height: 108)
    .cornerRadius(12)
    .padding(8)
  }
}

// MARK: - Previews
struct AsyncImageView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      AsyncImageView(imageURL: "www.fake.url.com")

      AsyncImageView(imageURL: "www.fake.url.com")
        .preferredColorScheme(.dark)
    }
    .padding()
    .previewLayout(.sizeThatFits)
  }
}
