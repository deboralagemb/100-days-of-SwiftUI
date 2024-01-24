//
//  RectangleDividerView.swift
//  Moonshot
//
//  Created by Débora Lage on 24/01/24.
//

import SwiftUI

struct RectangleDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackGround)
            .padding(.vertical)
    }
}

#Preview {
    RectangleDividerView()
}
