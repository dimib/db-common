//
//  Coordinator.swift
//  UndergroundPublisher
//
//  Created by Dimitri Brukakis on 05.10.24.
//

import Foundation
import UIKit

public protocol Coordinator {
    associatedtype ViewController: UIViewController
    var viewController: ViewController? { get }
    var navigationController: UINavigationController? { get }
    var parentCoordinator: (any Coordinator)? { get }

    func start()
    func stop()
}

public extension Coordinator {
    func start() {}
    func stop() {}
}
