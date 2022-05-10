//
//  DummyViewController.swift
//  Bankey
//
//  Created by Ricardo Sanchez on 18/4/22.
//

import UIKit

class DummyViewController: UIViewController {

    let stackView = UIStackView()
    let label = UILabel()
    let logOutButton = UIButton(type: .system)

    weak var loguotDelegate: LogoutDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController {
    func style() {

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        // Label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Welcome"

        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.configuration = .filled()
        logOutButton.setTitle("Logout", for: [])
        logOutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    }

    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logOutButton)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }

    @objc func logoutButtonTapped(_ sender: UIButton) {
        loguotDelegate?.didLogout()
    }
}
