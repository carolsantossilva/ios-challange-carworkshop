//
//  WorkshopDetailProtocols.swift
//  FindYourMechanicalWorkshop
//
//  Created Ana Carolina Silva on 04/08/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit
import GoogleMaps

// MARK: - Router
protocol WorkshopDetailRouterProtocol: class {
    func push(from view: UIViewController)
}

// MARK: - Interactor
protocol WorkshopDetailInteractorInputProtocol {
    func fetchCarWorkshopDetail(with id: String)
    func getPhotoURL(with reference: String, maxWidth: Int) -> String
}

// MARK: - Presenter
protocol WorkshopDetailPresenterInputProtocol: class {
    func viewDidLoad()
    func getPhotoURL() -> String?
}

protocol WorkshopDetailInteractorOutputProtocol: class {
    func handleSuccess(with result: Workshop)
    func handleFailure(with message: String)
}

// MARK: - View
protocol WorkshopDetailPresenterOutputProtocol: class {
    func showLoading(_ loading: Bool)
    func showError(message: String)
    func loadData(with workshop: Workshop)
    func addMapMarker(with: GMSMarker)
}
