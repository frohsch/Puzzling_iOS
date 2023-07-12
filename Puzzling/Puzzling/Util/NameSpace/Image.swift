//
//  Image.swift
//  Puzzling-iOS
//
//  Created by KJ on 2023/07/04.
//

import UIKit

public enum Image {
    
    // MARK: - TabBar
    
    public static let deselectedHome = UIImage(named: "deselectedHome")!
    public static let selectedHome = UIImage(named: "selectedHome")!
    public static let selectedPerson = UIImage(named: "selectedPerson")!
    public static let deselectedPerson = UIImage(named: "deselectedPerson")!
    
    // MARK: - Icon
    
    public static let xMark = UIImage(named: "xMark")!
    public static let chevronDown = UIImage(named: "chevronDown")!
    public static let chevronBack = UIImage(named: "chevronBack")!
    public static let defaultPuzzle = UIImage(named: "defaultPuzzle")!
    public static let notificationBell = UIImage(named: "notificationBell")!
    public static let warning = UIImage(named: "warning")!
    static let downIcon = UIImage(systemName: "chevron.down")?
        .withTintColor(.gray500, renderingMode: .alwaysOriginal)
    static let upIcon = UIImage(systemName: "chevron.up")?
        .withTintColor(.gray500, renderingMode: .alwaysOriginal)
    static let leftIcon = UIImage(systemName: "chevron.left")?
        .withTintColor(.label, renderingMode: .alwaysOriginal)
    static let rightIcon = UIImage(systemName: "chevron.right")?
        .withTintColor(.label, renderingMode: .alwaysOriginal)
    
    // MARK: - Rank
    
    public static let rank1st = UIImage(named: "rank1st")!
    public static let rank2nd = UIImage(named: "rank2nd")!
    public static let rank3rd = UIImage(named: "rank3rd")!
}