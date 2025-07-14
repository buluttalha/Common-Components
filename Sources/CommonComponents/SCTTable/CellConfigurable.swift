//
//  CellConfigurable.swift
//  TalipBOKESadaPayCase
//
//  Created by Talip on 19.11.2022.
//

import Foundation

public protocol CellConfigurable {
    associatedtype ModelType
    func configure(with model: ModelType)
}
