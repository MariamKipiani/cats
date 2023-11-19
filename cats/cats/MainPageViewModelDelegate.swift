//
//  MainPageViewModelDelegate.swift
//  cats
//
//  Created by user on 11/20/23.
//

import Foundation

protocol MainPageViewModelDelegate: AnyObject {
    func factsFetched(_ facts: [Fact])
    func showError(_ error: Error)
}

final class MainPageViewModel {
    private var facts: [Fact]?

    weak var delegate: MainPageViewModelDelegate?

    func viewDidLoad() {
        fetchFacts()
    }

    private func fetchFacts() {
        APIService.shared.fetchFacts { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let facts):
                self.facts = facts
                self.delegate?.factsFetched(facts)
            case .failure(let error):
                self.delegate?.showError(error)
            }
        }
    }
}

