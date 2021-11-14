//
//  FlashButton.swift
//  SampleApp
//
//  Created by Apple on 14/11/21.
//

import UIKit

final class FlashButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        settings()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        settings()
    }
    
    override var isSelected: Bool {
        didSet {
            let color: UIColor = isSelected ? .gray : .lightGray
            backgroundColor = color.withAlphaComponent(0.7)
        }
    }
    
}

private extension FlashButton {
    func settings() {
        setTitleColor(.darkGray, for: .normal)
        setTitleColor(.white, for: .selected)
        isSelected = false
    }
}
