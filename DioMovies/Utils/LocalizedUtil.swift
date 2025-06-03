//
//  LocalizedUtil.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 03/06/25.
//

import Foundation

func localized(_ key: String, _ args: CVarArg...) -> String {
    String(format: NSLocalizedString(key, comment: ""), arguments: args)
}

