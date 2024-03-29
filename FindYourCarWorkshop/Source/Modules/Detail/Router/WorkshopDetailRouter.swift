//
//  WorkshopDetailRouter.swift
//  FindYourMechanicalWorkshop
//
//  Created Ana Carolina Silva on 04/08/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class WorkshopDetailRouter: NSObject, WorkshopDetailRouterProtocol {

	// MARK: - Constants
	private let storyBoardName = "WorkshopDetail"
	private let viewIdentifier = "WorkshopDetailView"
    
    // MARK: - Properties
    var workshop: Workshop

	// MARK: - Viper Module Properties
	weak var view: WorkshopDetailView!

	// MARK: - Constructors
    init(with workshop: Workshop) {
        self.workshop = workshop
		super.init()

		let view = self.viewControllerFromStoryboard()
        let interactor = WorkshopDetailInteractor(client: GoogleAPIManager.shared)
        let presenter = WorkshopDetailPresenter(workshop: workshop)

		presenter.interactor = interactor
		presenter.router = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - WorkshopDetailRouterProtocol
    func push(from view: UIViewController) {
        view.navigationController?.pushViewController(self.view, animated: true)
    }

	// MARK: - Private methods
	private func viewControllerFromStoryboard() -> WorkshopDetailView {
		let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: self.viewIdentifier)

		return viewController as! WorkshopDetailView
	}
}
