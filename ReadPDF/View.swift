//
//  View.swift
//  ReadPDF
//
//  Created by Bhavik Bhatt on 14/02/23.
//

import Foundation
import SwiftUI

extension View{
    func hAligned(alignment: Alignment) -> some View{
        return self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAligned(alignment: Alignment) -> some View{
        return self.frame(maxHeight: .infinity, alignment: alignment)
    }
}
