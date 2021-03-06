//
//  Constants.swift
//  cryptoboard
//
//  Created by Jean Baptiste TERRAZZONI on 21/05/2018.
//  Copyright © 2018 terrazzoni. All rights reserved.
//

import Foundation
import UIKit

struct K {
    
    struct APIServer {
        static let baseURL = "https://min-api.cryptocompare.com"
        static let cdn = "https://www.cryptocompare.com"
    }
    
    struct APIParamsKeys {
        static let currenciesFrom = "fsyms"
        static let currenciesTo = "tsyms"
        static let currencyFrom = "fsym"
        static let currencyTo = "tsym"
        static let aggregate = "aggregate"
        static let limit = "limit"
    }
    
    struct APIValidity {
        static let currencyList: TimeInterval = 60 * 60 * 24
    }
    
    struct Design {
        static let CornerRadius: CGFloat = 7
        static let AnimationTime: TimeInterval = 0.3
    }
    
    static let Currencies: [Currency] = [
        Currency(id: 0, name: "Bitcoin", diminutive: "BTC", imageName: nil),
        Currency(id: 1, name: "Ethereum", diminutive: "ETH", imageName: nil),
        Currency(id: 2, name: "Bitcoin cash", diminutive: "BCH", imageName: nil),
        Currency(id: 3, name: "EOS", diminutive: "EOS", imageName: nil),
        Currency(id: 4, name: "LOL", diminutive: "LOL", imageName: nil),
    ]
    
    
}

enum HTTPHeaderFields: String {
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

enum CurrencyHistoryType {
    case day, hour, minute
}

enum LocalCurrency: String, Codable {
    case usd = "USD", eur = "EUR"
}

enum TableViewStatus {
    case wallet, coin
}

enum ThemeStatus {
    case clear, white, darkBlue
}

enum ChartVariation {
    case up, down
}

enum APIError: Error {
    case unknownError
    case connectionError
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    case unsupportedURL
}

enum StorageError: Error {
    case saveError
    case getError
}

enum VerticalPosition {
    case up
    case down
}
