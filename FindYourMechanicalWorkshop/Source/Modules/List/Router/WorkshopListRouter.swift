//
//  WorkshopListRouter.swift
//  FindYourMechanicalWorkshop
//
//  Created Ana Carolina Silva on 26/07/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class WorkshopListRouterRouter: NSObject, WorkshopListRouterProtocol {

	// MARK: - Constants
	private let storyBoardName = "WorkshopList"
	private let viewIdentifier = "WorkshopListView"

	// MARK: - Viper Module Properties
	weak var view: WorkshopListView!

	// MARK: - Constructors
	override init() {
		super.init()

		let view = self.viewControllerFromStoryboard()
		let interactor = WorkshopListInteractor()
		let presenter = WorkshopListPresenter()

		presenter.interactor = interactor
		presenter.router = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - WorkshopListRouterProtocol

	// MARK: - Private methods
	private func viewControllerFromStoryboard() -> WorkshopListView {
		let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: self.viewIdentifier)

		return viewController as! WorkshopListView
	}
}