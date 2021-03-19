//
//  ConfigView.swift
//  Canpine
//
//  Created by Takuya Ando on 2021/03/19.
//

import SwiftUI
import PartialSheet

struct ConfigView: View {
    
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    var strengths = ["Mild", "Medium", "Mature"]
    @State private var selectedStrength = 0
    
    var body: some View {
        VStack {
            VStack {
                Text("Settings Panel").font(.headline)
                Picker(selection: $selectedStrength, label: EmptyView()) {
                    ForEach(0 ..< strengths.count) {
                        Text(self.strengths[$0])
                    }
                }.onTapGesture {
                    // Fixes issue with scroll
                }
            }
            .padding()
            .frame(height: 250)
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
