//
//  LoginView.swift
//  Bakey
//
//  Created by Ricardo Sanchez on 18/4/22.
//

import Foundation
import UIKit

class LoginView: UIView {

    let stackView = UIStackView()
    let usernameTextFiled = UITextField()
    let passwordTextFiled = UITextField()
    let dividerView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not bee implemented")
    }
}

extension LoginView {

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        usernameTextFiled.translatesAutoresizingMaskIntoConstraints = false
        usernameTextFiled.placeholder = "Username"
        usernameTextFiled.delegate = self

        passwordTextFiled.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFiled.placeholder = "Password"
        passwordTextFiled.isSecureTextEntry = true
        passwordTextFiled.delegate = self
        passwordTextFiled.enablePasswordToggle()

        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill

        layer.cornerRadius = 5

        clipsToBounds = true
    }

    func layout() {
        stackView.addArrangedSubview(usernameTextFiled)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextFiled)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)

        ])

        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextFiled.endEditing(true)
        passwordTextFiled.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}
