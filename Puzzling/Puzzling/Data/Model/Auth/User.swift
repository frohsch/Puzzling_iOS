//
//  User.swift
//  Puzzling
//
//  Created by Minjoo Kim on 2023/07/19.
//

import Foundation

struct User {
    
    let name: String
    let memberID: Int
    let projectID: Int?
    let accessToken: String
    let refreshToken: String
    let isNewUser: Bool
}
