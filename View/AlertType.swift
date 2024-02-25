//
//  AlertType.swift
//
//
//  Created by Austin Xu on 2024/2/24.
//

import SwiftUI

// Alert type
enum AlertType {
    
    case success
    case error(title: String, message: String = "")
    
    func title() -> String {
        switch self {
        case .success:
            return "Success"
        case .error(title: let title, _):
            return title
        }
    }

    func message() -> String {
        switch self {
        case .success:
            return "Please confirm that you're still open to session requests"
        case .error(_, message: let message):
            return message
        }
    }
    
    // Left button action text for the alert view
    var leftActionText: String {
        switch self {
        case .success:
            return "Go"
        case .error(_, _):
            return "Go"
        }
    }
    
    // Right button action text for the alert view
    var rightActionText: String {
        switch self {
        case .success:
            return "Cancel"
        case .error(_, _):
            return "Cancel"
        }
    }
    
    func height(isShowVerticalButtons: Bool = false) -> CGFloat {
        switch self {
        case .success:
            return isShowVerticalButtons ? 220 : 150
        case .error(_, _):
            return isShowVerticalButtons ? 220 : 150
        }
    }
}
