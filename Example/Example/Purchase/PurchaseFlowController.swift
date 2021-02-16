//
//  PurchaseFlowController.swift
//  Example
//
//  Created by Adam Campbell on 30/6/20.
//  Copyright © 2020 Afterpay. All rights reserved.
//

import Afterpay
import Foundation

final class PurchaseFlowController: UIViewController {

  private let logicController: PurchaseLogicController
  private let productsViewController: ProductsViewController
  private let ownedNavigationController: UINavigationController
  private let checkoutHandler: CheckoutHandler

  init(logicController purchaseLogicController: PurchaseLogicController) {
    logicController = purchaseLogicController

    productsViewController = ProductsViewController { event in
      switch event {
      case .productEvent(.didTapPlus(let productId)):
        purchaseLogicController.incrementQuantityOfProduct(with: productId)

      case .productEvent(.didTapMinus(let productId)):
        purchaseLogicController.decrementQuantityOfProduct(with: productId)

      case .viewCart:
        purchaseLogicController.viewCart()
      }
    }

    ownedNavigationController = UINavigationController(rootViewController: productsViewController)

    checkoutHandler = CheckoutHandler(
      didCommenceCheckout: purchaseLogicController.loadCheckout,
      onShippingAddressDidChange: purchaseLogicController.selectAddress
    )

    Afterpay.setCheckoutV2Handler(checkoutHandler)

    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    self.view = UIView()
    install(ownedNavigationController)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    logicController.commandHandler = { [unowned self] command in
      DispatchQueue.main.async { self.execute(command: command) }
    }
  }

  private func execute(command: PurchaseLogicController.Command) {
    let logicController = self.logicController
    let navigationController = self.ownedNavigationController

    switch command {
    case .updateProducts(let products):
      productsViewController.update(products: products)

    case .showCart(let cart):
      let cartViewController = CartViewController(cart: cart) { event in
        switch event {
        case .didTapPay:
          logicController.payWithAfterpay()
        }
      }

      navigationController.pushViewController(cartViewController, animated: true)

    case .showAfterpayCheckout:
      Afterpay.presentCheckoutV2Modally(over: ownedNavigationController) { result in
        switch result {
        case .success(let token):
          logicController.success(with: token)
        case .cancelled(let reason):
          logicController.cancelled(with: reason)
        }
      }

    case .provideCheckoutTokenResult(let tokenResult):
      checkoutHandler.provideTokenResult(tokenResult: tokenResult)

    case .provideShippingOptions(let shippingOptions):
      checkoutHandler.provideShippingOptions(shippingOptions: shippingOptions)

    case .showAlertForErrorMessage(let errorMessage):
      let alert = AlertFactory.alert(for: errorMessage)
      navigationController.present(alert, animated: true, completion: nil)

    case .showSuccessWithMessage(let message):
      let messageViewController = MessageViewController(message: message)
      let viewControllers = [productsViewController, messageViewController]
      navigationController.setViewControllers(viewControllers, animated: true)
    }
  }

  // MARK: Unavailable

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
