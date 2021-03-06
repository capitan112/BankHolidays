//
//  NetworkDataFetcher.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation

enum ConversionFailure: Error {
    case invalidData
    case missingData
    case responceError
    case jsonDecondingError
    case customError
    case badURL
}

protocol NetworkDataFetcherProtocol {
    func fetchHolidays(completion: @escaping (Result<UKBankHolidays, Error>) -> Void)
}

final class NetworkDataFetcher: NetworkDataFetcherProtocol {
    var networkingService: NetworkProtocol

    init(networkingService: NetworkProtocol = NetworkService()) {
        self.networkingService = networkingService
    }

    func fetchHolidays(completion: @escaping (Result<UKBankHolidays, Error>) -> Void) {
        fetchGenericJSONData(path: RequestConstant.Server.APIPath, response: completion)
    }

    func fetchGenericJSONData<T: Decodable>(path _: String, response: @escaping (Result<T, Error>) -> Void) {
        networkingService.request { dataResponse in
            guard let data = try? dataResponse.get() else {
                response(.failure(ConversionFailure.responceError))
                return
            }

            self.decodeJSON(from: data, completion: response)
        }
    }

    private func decodeJSON<T: Decodable>(from data: Data?, completion: @escaping (Result<T, Error>) -> Void) {
        guard let data = data else {
            completion(.failure(ConversionFailure.missingData))
            return
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yearMonthFormatter)
        do {
            completion(.success(try decoder.decode(T.self, from: data)))
        } catch {
            completion(.failure(ConversionFailure.jsonDecondingError))
        }
    }
}
