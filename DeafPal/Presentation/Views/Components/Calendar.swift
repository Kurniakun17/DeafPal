//
//  Calendar.swift
//  DeafPal
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/10/24.
//

import SwiftUI

struct Calendar: View {
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                Text("OKT")
                    .foregroundStyle(.red)
                    .font(.system(size: 8))
                    .fontWeight(.bold)
                Text("22")
                    .font(.headline)
                    .fontWeight(.bold)

                Text("Selasa")
                    .foregroundStyle(.gray)
                    .font(.system(size: 8))
            }
        }
        .frame(width: 48, height: 48)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    Calendar()
}
