

import Foundation
import SwiftUI

struct Task : Identifiable , Equatable {
    
    var id : String = UUID().uuidString
    let name : String
    let taskName : String
    let date : Date
    let priority : Priority
    
}

enum Priority : Int , Identifiable , CaseIterable {
    
    var id : Int { rawValue }
    
    case normal
    case medium
    case high
    
    var title : String {
        
        switch self {
        case .normal :
            return "Facil"
        case .medium :
            return "Médio"
        case .high :
            return "Difícil"
        }
        
    }
    
    var color : Color {
        
        switch self {
        case .normal:
            return .green
        case .medium:
            return .orange
        case .high :
            return .red
        }
    }
    
}

enum SortType : String , Identifiable , CaseIterable {
    
    var id : String { rawValue }
    
    case alphabetical
    case date
    case priority
    
}


