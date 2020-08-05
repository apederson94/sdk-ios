//
//  SVG.swift
//  Afterpay
//
//  Created by Adam Campbell on 29/7/20.
//  Copyright © 2020 Afterpay. All rights reserved.
//

import Foundation
#if compiler(>=5.1) && compiler(<5.3)
@_implementationOnly import Macaw
#else
import Macaw
#endif
import UIKit

// swiftlint:disable line_length
struct SVG: Equatable {

  let size: CGSize
  let minimumWidth: CGFloat
  private let svgString: String

  var aspectRatio: CGFloat { size.height / size.width }
  var node: Node { (try? SVGParser.parse(text: svgString)) ?? Group() }

  init(size: CGSize, minimumWidth: CGFloat, svgString: String) {
    self.size = size
    self.minimumWidth = minimumWidth
    self.svgString = svgString
  }

  static let badgeBlackOnMint = SVG(
    size: CGSize(width: 1582, height: 551),
    minimumWidth: 64,
    svgString: """
    <svg width="1582" height="551" viewBox="0 0 1582 551" fill="none" xmlns="http://www.w3.org/2000/svg">
    <g clip-path="url(#clip0)">
    <path d="M1306.3 550.5H275.2C123.2 550.5 0 427.3 0 275.3C0 123.3 123.2 0.100006 275.2 0.100006H1306.3C1458.3 0.100006 1581.5 123.3 1581.5 275.3C1581.6 427.2 1458.3 550.5 1306.3 550.5Z" fill="#B2FCE4"/>
    <path d="M1348 209.5L1313.4 189.7L1278.3 169.6C1255.1 156.3 1226.1 173 1226.1 199.8V204.3C1226.1 206.8 1227.4 209.1 1229.6 210.3L1245.9 219.6C1250.4 222.2 1256 218.9 1256 213.7V203C1256 197.7 1261.7 194.4 1266.3 197L1298.3 215.4L1330.2 233.7C1334.8 236.3 1334.8 243 1330.2 245.6L1298.3 263.9L1266.3 282.3C1261.7 284.9 1256 281.6 1256 276.3V271C1256 244.2 1227 227.4 1203.8 240.8L1168.7 260.9L1134.1 280.7C1110.8 294.1 1110.8 327.8 1134.1 341.2L1168.7 361L1203.8 381.1C1227 394.4 1256 377.7 1256 350.9V346.4C1256 343.9 1254.7 341.6 1252.5 340.4L1236.2 331.1C1231.7 328.5 1226.1 331.8 1226.1 337V347.7C1226.1 353 1220.4 356.3 1215.8 353.7L1183.8 335.3L1151.9 317C1147.3 314.4 1147.3 307.7 1151.9 305.1L1183.8 286.8L1215.8 268.4C1220.4 265.8 1226.1 269.1 1226.1 274.4V279.7C1226.1 306.5 1255.1 323.3 1278.3 309.9L1313.4 289.8L1348 270C1371.3 256.5 1371.3 222.9 1348 209.5Z" fill="black"/>
    <path d="M1121 216.1L1040 383.4H1006.4L1036.7 320.9L989 216.1H1023.5L1054.1 286.3L1087.5 216.1H1121Z" fill="black"/>
    <path d="M311.1 275.5C311.1 255.5 296.6 241.5 278.8 241.5C261 241.5 246.5 255.8 246.5 275.5C246.5 295 261 309.5 278.8 309.5C296.6 309.5 311.1 295.5 311.1 275.5ZM311.4 334.9V319.5C302.6 330.2 289.5 336.8 273.9 336.8C241.3 336.8 216.6 310.7 216.6 275.5C216.6 240.6 242.3 214 274.6 214C289.8 214 302.6 220.7 311.4 231.1V216.1H340.6V334.9H311.4V334.9Z" fill="black"/>
    <path d="M482.6 308.5C472.4 308.5 469.5 304.7 469.5 294.7V242H488.3V216.1H469.5V187.1H439.6V216.1H401V204.3C401 194.3 404.8 190.5 415.3 190.5H421.9V167.5H407.5C382.8 167.5 371.1 175.6 371.1 200.3V216.2H354.5V242H371.1V334.9H401V242H439.6V300.2C439.6 324.4 448.9 334.9 473.1 334.9H488.5V308.5H482.6Z" fill="black"/>
    <path d="M590 264.8C587.9 249.4 575.3 240.1 560.5 240.1C545.8 240.1 533.6 249.1 530.6 264.8H590ZM530.3 283.3C532.4 300.9 545 310.9 561 310.9C573.6 310.9 583.3 305 589 295.5H619.7C612.6 320.7 590 336.8 560.3 336.8C524.4 336.8 499.2 311.6 499.2 275.7C499.2 239.8 525.8 213.9 561 213.9C596.4 213.9 622.1 240 622.1 275.7C622.1 278.3 621.9 280.9 621.4 283.3H530.3V283.3Z" fill="black"/>
    <path d="M812.5 275.5C812.5 256.3 798 241.5 780.2 241.5C762.4 241.5 747.9 255.8 747.9 275.5C747.9 295 762.4 309.5 780.2 309.5C798 309.5 812.5 294.8 812.5 275.5ZM718.4 383.4V216.1H747.6V231.5C756.4 220.6 769.5 213.9 785.1 213.9C817.2 213.9 842.4 240.3 842.4 275.2C842.4 310.1 816.7 336.7 784.4 336.7C769.4 336.7 757.1 330.8 748.5 320.8V383.3H718.4V383.4Z" fill="black"/>
    <path d="M947.7 275.5C947.7 255.5 933.2 241.5 915.4 241.5C897.6 241.5 883.1 255.8 883.1 275.5C883.1 295 897.6 309.5 915.4 309.5C933.2 309.5 947.7 295.5 947.7 275.5ZM948 334.9V319.5C939.2 330.2 926.1 336.8 910.5 336.8C877.9 336.8 853.2 310.7 853.2 275.5C853.2 240.6 878.9 214 911.2 214C926.4 214 939.2 220.7 948 231.1V216.1H977.2V334.9H948V334.9Z" fill="black"/>
    <path d="M665.7 227.7C665.7 227.7 673.1 213.9 691.4 213.9C699.2 213.9 704.2 216.6 704.2 216.6V246.9C704.2 246.9 693.2 240.1 683.1 241.5C673 242.9 666.6 252.1 666.6 264.5V334.8H636.4V216.1H665.6V227.7H665.7Z" fill="black"/>
    </g>
    <defs>
    <clipPath id="clip0">
    <rect width="1582" height="551" fill="white"/>
    </clipPath>
    </defs>
    </svg>
    """
  )

  static let badgeMintOnBlack = SVG(
    size: CGSize(width: 1582, height: 551),
    minimumWidth: 64,
    svgString: """
    <svg width="1582" height="551" viewBox="0 0 1582 551" fill="none" xmlns="http://www.w3.org/2000/svg">
    <g clip-path="url(#clip0)">
    <path d="M1306.3 550.5H275.2C123.2 550.5 0 427.3 0 275.3C0 123.3 123.2 0.100006 275.2 0.100006H1306.3C1458.3 0.100006 1581.5 123.3 1581.5 275.3C1581.6 427.2 1458.3 550.5 1306.3 550.5Z" fill="black"/>
    <path d="M1348 209.5L1313.4 189.7L1278.3 169.6C1255.1 156.3 1226.1 173 1226.1 199.8V204.3C1226.1 206.8 1227.4 209.1 1229.6 210.3L1245.9 219.6C1250.4 222.2 1256 218.9 1256 213.7V203C1256 197.7 1261.7 194.4 1266.3 197L1298.3 215.4L1330.2 233.7C1334.8 236.3 1334.8 243 1330.2 245.6L1298.3 263.9L1266.3 282.3C1261.7 284.9 1256 281.6 1256 276.3V271C1256 244.2 1227 227.4 1203.8 240.8L1168.7 260.9L1134.1 280.7C1110.8 294.1 1110.8 327.8 1134.1 341.2L1168.7 361L1203.8 381.1C1227 394.4 1256 377.7 1256 350.9V346.4C1256 343.9 1254.7 341.6 1252.5 340.4L1236.2 331.1C1231.7 328.5 1226.1 331.8 1226.1 337V347.7C1226.1 353 1220.4 356.3 1215.8 353.7L1183.8 335.3L1151.9 317C1147.3 314.4 1147.3 307.7 1151.9 305.1L1183.8 286.8L1215.8 268.4C1220.4 265.8 1226.1 269.1 1226.1 274.4V279.7C1226.1 306.5 1255.1 323.3 1278.3 309.9L1313.4 289.8L1348 270C1371.3 256.5 1371.3 222.9 1348 209.5Z" fill="#B2FCE4"/>
    <path d="M1121 216.1L1040 383.4H1006.4L1036.7 320.9L989 216.1H1023.5L1054.1 286.3L1087.5 216.1H1121Z" fill="#B2FCE4"/>
    <path d="M311.1 275.5C311.1 255.5 296.6 241.5 278.8 241.5C261 241.5 246.5 255.8 246.5 275.5C246.5 295 261 309.5 278.8 309.5C296.6 309.5 311.1 295.5 311.1 275.5ZM311.4 334.9V319.5C302.6 330.2 289.5 336.8 273.9 336.8C241.3 336.8 216.6 310.7 216.6 275.5C216.6 240.6 242.3 214 274.6 214C289.8 214 302.6 220.7 311.4 231.1V216.1H340.6V334.9H311.4V334.9Z" fill="#B2FCE4"/>
    <path d="M482.6 308.5C472.4 308.5 469.5 304.7 469.5 294.7V242H488.3V216.1H469.5V187.1H439.6V216.1H401V204.3C401 194.3 404.8 190.5 415.3 190.5H421.9V167.5H407.5C382.8 167.5 371.1 175.6 371.1 200.3V216.2H354.5V242H371.1V334.9H401V242H439.6V300.2C439.6 324.4 448.9 334.9 473.1 334.9H488.5V308.5H482.6Z" fill="#B2FCE4"/>
    <path d="M590 264.8C587.9 249.4 575.3 240.1 560.5 240.1C545.8 240.1 533.6 249.1 530.6 264.8H590ZM530.3 283.3C532.4 300.9 545 310.9 561 310.9C573.6 310.9 583.3 305 589 295.5H619.7C612.6 320.7 590 336.8 560.3 336.8C524.4 336.8 499.2 311.6 499.2 275.7C499.2 239.8 525.8 213.9 561 213.9C596.4 213.9 622.1 240 622.1 275.7C622.1 278.3 621.9 280.9 621.4 283.3H530.3V283.3Z" fill="#B2FCE4"/>
    <path d="M812.5 275.5C812.5 256.3 798 241.5 780.2 241.5C762.4 241.5 747.9 255.8 747.9 275.5C747.9 295 762.4 309.5 780.2 309.5C798 309.5 812.5 294.8 812.5 275.5ZM718.4 383.4V216.1H747.6V231.5C756.4 220.6 769.5 213.9 785.1 213.9C817.2 213.9 842.4 240.3 842.4 275.2C842.4 310.1 816.7 336.7 784.4 336.7C769.4 336.7 757.1 330.8 748.5 320.8V383.3H718.4V383.4Z" fill="#B2FCE4"/>
    <path d="M947.7 275.5C947.7 255.5 933.2 241.5 915.4 241.5C897.6 241.5 883.1 255.8 883.1 275.5C883.1 295 897.6 309.5 915.4 309.5C933.2 309.5 947.7 295.5 947.7 275.5ZM948 334.9V319.5C939.2 330.2 926.1 336.8 910.5 336.8C877.9 336.8 853.2 310.7 853.2 275.5C853.2 240.6 878.9 214 911.2 214C926.4 214 939.2 220.7 948 231.1V216.1H977.2V334.9H948V334.9Z" fill="#B2FCE4"/>
    <path d="M665.7 227.7C665.7 227.7 673.1 213.9 691.4 213.9C699.2 213.9 704.2 216.6 704.2 216.6V246.9C704.2 246.9 693.2 240.1 683.1 241.5C673 242.9 666.6 252.1 666.6 264.5V334.8H636.4V216.1H665.6V227.7H665.7Z" fill="#B2FCE4"/>
    </g>
    <defs>
    <clipPath id="clip0">
    <rect width="1582" height="551" fill="white"/>
    </clipPath>
    </defs>
    </svg>
    """
  )

  static let badgeWhiteOnBlack: SVG = SVG(
    size: CGSize(width: 1582, height: 551),
    minimumWidth: 64,
    svgString: """
    <svg width="1582" height="551" viewBox="0 0 1582 551" fill="none" xmlns="http://www.w3.org/2000/svg">
    <g clip-path="url(#clip0)">
    <path d="M1306.3 550.5H275.2C123.2 550.5 0 427.3 0 275.3C0 123.3 123.2 0.100006 275.2 0.100006H1306.3C1458.3 0.100006 1581.5 123.3 1581.5 275.3C1581.6 427.2 1458.3 550.5 1306.3 550.5Z" fill="black"/>
    <path d="M1348 209.5L1313.4 189.7L1278.3 169.6C1255.1 156.3 1226.1 173 1226.1 199.8V204.3C1226.1 206.8 1227.4 209.1 1229.6 210.3L1245.9 219.6C1250.4 222.2 1256 218.9 1256 213.7V203C1256 197.7 1261.7 194.4 1266.3 197L1298.3 215.4L1330.2 233.7C1334.8 236.3 1334.8 243 1330.2 245.6L1298.3 263.9L1266.3 282.3C1261.7 284.9 1256 281.6 1256 276.3V271C1256 244.2 1227 227.4 1203.8 240.8L1168.7 260.9L1134.1 280.7C1110.8 294.1 1110.8 327.8 1134.1 341.2L1168.7 361L1203.8 381.1C1227 394.4 1256 377.7 1256 350.9V346.4C1256 343.9 1254.7 341.6 1252.5 340.4L1236.2 331.1C1231.7 328.5 1226.1 331.8 1226.1 337V347.7C1226.1 353 1220.4 356.3 1215.8 353.7L1183.8 335.3L1151.9 317C1147.3 314.4 1147.3 307.7 1151.9 305.1L1183.8 286.8L1215.8 268.4C1220.4 265.8 1226.1 269.1 1226.1 274.4V279.7C1226.1 306.5 1255.1 323.3 1278.3 309.9L1313.4 289.8L1348 270C1371.3 256.5 1371.3 222.9 1348 209.5Z" fill="white"/>
    <path d="M1121 216.1L1040 383.4H1006.4L1036.7 320.9L989 216.1H1023.5L1054.1 286.3L1087.5 216.1H1121Z" fill="white"/>
    <path d="M311.1 275.5C311.1 255.5 296.6 241.5 278.8 241.5C261 241.5 246.5 255.8 246.5 275.5C246.5 295 261 309.5 278.8 309.5C296.6 309.5 311.1 295.5 311.1 275.5ZM311.4 334.9V319.5C302.6 330.2 289.5 336.8 273.9 336.8C241.3 336.8 216.6 310.7 216.6 275.5C216.6 240.6 242.3 214 274.6 214C289.8 214 302.6 220.7 311.4 231.1V216.1H340.6V334.9H311.4V334.9Z" fill="white"/>
    <path d="M482.6 308.5C472.4 308.5 469.5 304.7 469.5 294.7V242H488.3V216.1H469.5V187.1H439.6V216.1H401V204.3C401 194.3 404.8 190.5 415.3 190.5H421.9V167.5H407.5C382.8 167.5 371.1 175.6 371.1 200.3V216.2H354.5V242H371.1V334.9H401V242H439.6V300.2C439.6 324.4 448.9 334.9 473.1 334.9H488.5V308.5H482.6Z" fill="white"/>
    <path d="M590 264.8C587.9 249.4 575.3 240.1 560.5 240.1C545.8 240.1 533.6 249.1 530.6 264.8H590ZM530.3 283.3C532.4 300.9 545 310.9 561 310.9C573.6 310.9 583.3 305 589 295.5H619.7C612.6 320.7 590 336.8 560.3 336.8C524.4 336.8 499.2 311.6 499.2 275.7C499.2 239.8 525.8 213.9 561 213.9C596.4 213.9 622.1 240 622.1 275.7C622.1 278.3 621.9 280.9 621.4 283.3H530.3V283.3Z" fill="white"/>
    <path d="M812.5 275.5C812.5 256.3 798 241.5 780.2 241.5C762.4 241.5 747.9 255.8 747.9 275.5C747.9 295 762.4 309.5 780.2 309.5C798 309.5 812.5 294.8 812.5 275.5ZM718.4 383.4V216.1H747.6V231.5C756.4 220.6 769.5 213.9 785.1 213.9C817.2 213.9 842.4 240.3 842.4 275.2C842.4 310.1 816.7 336.7 784.4 336.7C769.4 336.7 757.1 330.8 748.5 320.8V383.3H718.4V383.4Z" fill="white"/>
    <path d="M947.7 275.5C947.7 255.5 933.2 241.5 915.4 241.5C897.6 241.5 883.1 255.8 883.1 275.5C883.1 295 897.6 309.5 915.4 309.5C933.2 309.5 947.7 295.5 947.7 275.5ZM948 334.9V319.5C939.2 330.2 926.1 336.8 910.5 336.8C877.9 336.8 853.2 310.7 853.2 275.5C853.2 240.6 878.9 214 911.2 214C926.4 214 939.2 220.7 948 231.1V216.1H977.2V334.9H948V334.9Z" fill="white"/>
    <path d="M665.7 227.7C665.7 227.7 673.1 213.9 691.4 213.9C699.2 213.9 704.2 216.6 704.2 216.6V246.9C704.2 246.9 693.2 240.1 683.1 241.5C673 242.9 666.6 252.1 666.6 264.5V334.8H636.4V216.1H665.6V227.7H665.7Z" fill="white"/>
    </g>
    <defs>
    <clipPath id="clip0">
    <rect width="1582" height="551" fill="white"/>
    </clipPath>
    </defs>
    </svg>
    """
  )

  static let badgeBlackOnWhite: SVG = SVG(
    size: CGSize(width: 1582, height: 551),
    minimumWidth: 64,
    svgString: """
    <svg width="1582" height="551" viewBox="0 0 1582 551" fill="none" xmlns="http://www.w3.org/2000/svg">
    <g clip-path="url(#clip0)">
    <path d="M1306.3 550.5H275.2C123.2 550.5 0 427.3 0 275.3C0 123.3 123.2 0.100006 275.2 0.100006H1306.3C1458.3 0.100006 1581.5 123.3 1581.5 275.3C1581.6 427.2 1458.3 550.5 1306.3 550.5Z" fill="white"/>
    <path d="M1348 209.5L1313.4 189.7L1278.3 169.6C1255.1 156.3 1226.1 173 1226.1 199.8V204.3C1226.1 206.8 1227.4 209.1 1229.6 210.3L1245.9 219.6C1250.4 222.2 1256 218.9 1256 213.7V203C1256 197.7 1261.7 194.4 1266.3 197L1298.3 215.4L1330.2 233.7C1334.8 236.3 1334.8 243 1330.2 245.6L1298.3 263.9L1266.3 282.3C1261.7 284.9 1256 281.6 1256 276.3V271C1256 244.2 1227 227.4 1203.8 240.8L1168.7 260.9L1134.1 280.7C1110.8 294.1 1110.8 327.8 1134.1 341.2L1168.7 361L1203.8 381.1C1227 394.4 1256 377.7 1256 350.9V346.4C1256 343.9 1254.7 341.6 1252.5 340.4L1236.2 331.1C1231.7 328.5 1226.1 331.8 1226.1 337V347.7C1226.1 353 1220.4 356.3 1215.8 353.7L1183.8 335.3L1151.9 317C1147.3 314.4 1147.3 307.7 1151.9 305.1L1183.8 286.8L1215.8 268.4C1220.4 265.8 1226.1 269.1 1226.1 274.4V279.7C1226.1 306.5 1255.1 323.3 1278.3 309.9L1313.4 289.8L1348 270C1371.3 256.5 1371.3 222.9 1348 209.5Z" fill="black"/>
    <path d="M1121 216.1L1040 383.4H1006.4L1036.7 320.9L989 216.1H1023.5L1054.1 286.3L1087.5 216.1H1121Z" fill="black"/>
    <path d="M311.1 275.5C311.1 255.5 296.6 241.5 278.8 241.5C261 241.5 246.5 255.8 246.5 275.5C246.5 295 261 309.5 278.8 309.5C296.6 309.5 311.1 295.5 311.1 275.5ZM311.4 334.9V319.5C302.6 330.2 289.5 336.8 273.9 336.8C241.3 336.8 216.6 310.7 216.6 275.5C216.6 240.6 242.3 214 274.6 214C289.8 214 302.6 220.7 311.4 231.1V216.1H340.6V334.9H311.4V334.9Z" fill="black"/>
    <path d="M482.6 308.5C472.4 308.5 469.5 304.7 469.5 294.7V242H488.3V216.1H469.5V187.1H439.6V216.1H401V204.3C401 194.3 404.8 190.5 415.3 190.5H421.9V167.5H407.5C382.8 167.5 371.1 175.6 371.1 200.3V216.2H354.5V242H371.1V334.9H401V242H439.6V300.2C439.6 324.4 448.9 334.9 473.1 334.9H488.5V308.5H482.6Z" fill="black"/>
    <path d="M590 264.8C587.9 249.4 575.3 240.1 560.5 240.1C545.8 240.1 533.6 249.1 530.6 264.8H590ZM530.3 283.3C532.4 300.9 545 310.9 561 310.9C573.6 310.9 583.3 305 589 295.5H619.7C612.6 320.7 590 336.8 560.3 336.8C524.4 336.8 499.2 311.6 499.2 275.7C499.2 239.8 525.8 213.9 561 213.9C596.4 213.9 622.1 240 622.1 275.7C622.1 278.3 621.9 280.9 621.4 283.3H530.3V283.3Z" fill="black"/>
    <path d="M812.5 275.5C812.5 256.3 798 241.5 780.2 241.5C762.4 241.5 747.9 255.8 747.9 275.5C747.9 295 762.4 309.5 780.2 309.5C798 309.5 812.5 294.8 812.5 275.5ZM718.4 383.4V216.1H747.6V231.5C756.4 220.6 769.5 213.9 785.1 213.9C817.2 213.9 842.4 240.3 842.4 275.2C842.4 310.1 816.7 336.7 784.4 336.7C769.4 336.7 757.1 330.8 748.5 320.8V383.3H718.4V383.4Z" fill="black"/>
    <path d="M947.7 275.5C947.7 255.5 933.2 241.5 915.4 241.5C897.6 241.5 883.1 255.8 883.1 275.5C883.1 295 897.6 309.5 915.4 309.5C933.2 309.5 947.7 295.5 947.7 275.5ZM948 334.9V319.5C939.2 330.2 926.1 336.8 910.5 336.8C877.9 336.8 853.2 310.7 853.2 275.5C853.2 240.6 878.9 214 911.2 214C926.4 214 939.2 220.7 948 231.1V216.1H977.2V334.9H948V334.9Z" fill="black"/>
    <path d="M665.7 227.7C665.7 227.7 673.1 213.9 691.4 213.9C699.2 213.9 704.2 216.6 704.2 216.6V246.9C704.2 246.9 693.2 240.1 683.1 241.5C673 242.9 666.6 252.1 666.6 264.5V334.8H636.4V216.1H665.6V227.7H665.7Z" fill="black"/>
    </g>
    <defs>
    <clipPath id="clip0">
    <rect width="1582" height="551" fill="white"/>
    </clipPath>
    </defs>
    </svg>
    """
  )

}

struct SVGPair {
  let lightSVG: SVG
  let darkSVG: SVG
}
// swiftlint:enable line_length
