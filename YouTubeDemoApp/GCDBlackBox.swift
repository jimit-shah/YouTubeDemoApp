//
//  GCDBlackBox.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/9/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import Foundation

// Perform UI Updates on Main Queue
func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
  DispatchQueue.main.async {
    updates()
  }
}
