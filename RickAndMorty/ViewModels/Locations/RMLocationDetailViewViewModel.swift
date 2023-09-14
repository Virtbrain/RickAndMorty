//
//  RMLocationDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Alexey Manankov on 14.09.2023.
//

import UIKit

protocol RMLocationDetailViewViewModelDelegate: AnyObject {
    func didFetchLocationDetails()
}

final class RMLocationDetailViewViewModel {
    private let endpointUrl: URL?
    private var dataTuple: (location: RMLocation, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            
            delegate?.didFetchLocationDetails()
        }
    }
    
    enum SectionType {
        case information(viewModels: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [RMCharacterCollectionViewCellViewModel])
    }
    
    public weak var delegate: RMLocationDetailViewViewModelDelegate?
    
    public private(set) var cellViewModels: [SectionType] = []
    
    //MARK: - Init
    init (endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }
    
    public func character(at index: Int) -> RMCharacter? {
        guard let dataTuple = dataTuple else {
            return nil
        }
        return dataTuple.characters[index]
    }
    
    //MARK: - Pivate
    private func createCellViewModels() {
        guard let dataTuple = dataTuple else {
            return
        }
        
        let location  = dataTuple.location
        let characters = dataTuple.characters
        var createdString = location.created
        if let date = RMCharacterInfoCollectionViewCellViewModel.dateformatter.date(from: location.created) {
            createdString = RMCharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(from: date)
        }
        cellViewModels = [
            .information(viewModels: [
                .init(title: "Location Name", value: location.name),
                .init(title: "Type", value: location.type),
                .init(title: "Dimention", value: location.dimension),
                .init(title: "Created", value: createdString)
            ]),
            .characters(viewModel: characters.compactMap({ character in
                return RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image))
            }))
        ]
    }
    
    /// Fetch backing location model
    public func fetchLocationData() {
        guard let url = endpointUrl, let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMLocation.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(location: model)
            case .failure:
                break
            }
        }
    }
    
    private func fetchRelatedCharacters(location: RMLocation) {
        let requests: [RMRequest] = location.residents.compactMap({
            return URL(string: $0)
        }).compactMap({
            return RMRequest(url: $0)
        })
        
        //Dispatch group(notified when all stuff are complited)
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        
        for request in requests {
            group.enter()
            RMService.shared.execute(request, expecting: RMCharacter.self) { result in
                defer { //this will run last in the callback
                    group.leave()
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure(_):
                    break
                }
            }
        }
        group.notify(queue: .main) {
            self.dataTuple = (
                location: location,
                characters: characters
            )
        }
    }
}
