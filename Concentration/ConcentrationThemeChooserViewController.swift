//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Svitlana Dzyuban on 7/7/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {

    var spliViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }

    private var lastSeguedConcentrationController: ConcentrationViewController?

    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = spliViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle {
                cvc.selectedTheme = themeName
            }
        } else if let cvc = lastSeguedConcentrationController {
            if let themeName = (sender as? UIButton)?.currentTitle {
                cvc.selectedTheme = themeName
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }

    override func awakeFromNib() {
        splitViewController?.delegate = self
    }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.selectedTheme == nil {
                return true
            }
        }
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.selectedTheme = themeName
                    lastSeguedConcentrationController = cvc
                }
            }
        }
    }
}
