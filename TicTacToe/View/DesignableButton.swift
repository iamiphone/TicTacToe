//
//  DesignableButton.swift
//  TicTacToe
//

import UIKit

class DesignableButton: UIButton {
    
    func selectedButtonIndex(index: Int, player: String) {
        self.setTitle("\(player)", for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.backgroundColor = UIColor.gray
        self.isUserInteractionEnabled = false
    }
    
    func clearButtonContent(_ : DesignableButton) {
        self.setTitle("", for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.backgroundColor = UIColor.cyan
        self.isUserInteractionEnabled = true
    }
}
