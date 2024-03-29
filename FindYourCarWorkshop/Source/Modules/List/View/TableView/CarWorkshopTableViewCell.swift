//
//  CarWorkshopTableViewCell.swift
//  FindYourMechanicalWorkshop
//
//  Created by Ana Carolina Silva on 03/08/19.
//  Copyright © 2019 Ana Carolina Silva. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

final class CarWorkshopTableViewCell: UITableViewCell, Reusable {

    // MARK: - Outlets
    @IBOutlet private weak var carWorkshopNameLabel: UILabel!
    @IBOutlet private weak var carWorkshopImage: UIImageView!
    @IBOutlet private weak var carWorkshopRatingLabel: UILabel!
    
    @IBOutlet private weak var carWorkshopTrailingSuperviewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var carWorkshopTrailingRatingConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    private let kPlaceholderImageName = "placeholder-image"
    
    // MARK: - Setup Cell
    func setup(with workshop: Workshop, photoURL: String?) {
        
        if let aPhotoURL = photoURL {
            let url = URL(string: aPhotoURL)
            carWorkshopImage.kf.indicatorType = .activity
            carWorkshopImage.kf.setImage(with: url)
        }
        
        carWorkshopNameLabel.text = workshop.name
        
        guard let rating = workshop.rating else {
            handleNameLabelConstraints()
            return
        }
        carWorkshopRatingLabel.text = String(rating)
    }
    
    // MARK: - Private Methods
    private func handleNameLabelConstraints() {
        carWorkshopRatingLabel.isHidden = true
        layoutIfNeeded()
    }
}
