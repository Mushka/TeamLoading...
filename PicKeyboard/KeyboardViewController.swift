//
//  KeyboardViewController.swift
//  PicKeyboard
//
//  Created by Nikolai Vogler on 4/16/15.
//  Copyright (c) 2015 Nikolai Vogler. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    var inputtedWordLengths = Stack<Int>()

    @IBOutlet weak var nextKeyboardButton: UIButton!
    @IBOutlet weak var scroller: UIScrollView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        
        view = objects[0] as! UIView
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
    }
    
    @IBAction func picButtonPressed(button: UIButton) {
        var string = button.titleLabel?.text
        if let title = string {
            if ((textDocumentProxy as! UIKeyInput).hasText()) {
                (textDocumentProxy as! UIKeyInput).insertText(" \(title)")
                inputtedWordLengths.push(count(title) + 1)
            } else {
                (textDocumentProxy as! UIKeyInput).insertText("\(title)")
                inputtedWordLengths.push(count(title))
            }
        }
        else { }
    }

    // FIX POSITION OF DELETE BUTTON
    @IBAction func deleteButtonPressed(button: UIButton) {
        if (inputtedWordLengths.isEmpty()) {
            (textDocumentProxy as! UIKeyInput).deleteBackward()
        } else {
            var nToDelete = inputtedWordLengths.pop()
            for _ in 1...nToDelete {
                (textDocumentProxy as! UIKeyInput).deleteBackward()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as! UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
//        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
