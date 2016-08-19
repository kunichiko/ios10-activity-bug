//
//  ViewController.swift
//  ios10-activity-bug
//
//  Created by Kunihiko Ohnaka on 2016/08/18.
//  Copyright © 2016年 Kunihiko Ohnaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var openActivityButton: UIButton!

    @IBAction func openActivityButtonTouchDown(_ sender: AnyObject) {
        let text = "Test Text"
        let printData = UISimpleTextPrintFormatter(text: text)
        let vc = UIActivityViewController(activityItems: [text, printData], applicationActivities: nil)
        vc.completionWithItemsHandler = { (type,completed,items,error) in
            print("completed. type=\(type) completed=\(completed) items=\(items) error=\(error)")
        }
        
        vc.modalPresentationStyle = .popover
        vc.popoverPresentationController?.sourceView = self.openActivityButton
        vc.popoverPresentationController?.sourceRect = self.openActivityButton.bounds
        vc.popoverPresentationController?.permittedArrowDirections = .up
        vc.popoverPresentationController?.delegate = self
        
        self.present(vc, animated: true) { () in
        }
    }
}

extension ViewController : UIPopoverPresentationControllerDelegate {
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("popoverPresentationControllerDidDismissPopover: called")
    }
}
