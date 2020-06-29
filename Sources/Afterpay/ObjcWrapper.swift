//
//  ObjcWrapper.swift
//  Afterpay
//
//  Created by Adam Campbell on 25/6/20.
//  Copyright © 2020 Afterpay. All rights reserved.
//

import Foundation
import UIKit

@objc(Afterpay)
@available(swift, obsoleted: 1.0, message: "This wrapper should only be used from Objective-C")
public final class AfterpayWrapper: NSObject {

  @available(*, unavailable)
  public override init() {}

  @objc(presentCheckoutOverViewController:loadingURL:)
  public static func presentCheckout(
    over viewController: UIViewController,
    loading url: URL
  ) {
    Afterpay.presentCheckout(
      over: viewController,
      loading: url,
      animated: true,
      presentationCompletion: nil,
      cancelHandler: nil,
      successHandler: { _ in }
    )
  }

}
