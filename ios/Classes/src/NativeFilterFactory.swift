//
//  NativeFilterFactory.swift
//  native_filters
//
//  Created by Oleg Sukhotskyi on 17.01.2022.
//

import Foundation

class NativeFilterFactory {
    let messenger: FlutterBinaryMessenger
    let methodChannel: FlutterMethodChannel
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        self.methodChannel = FlutterMethodChannel(name: "CIFilterFactory",
                                                  binaryMessenger: messenger)
    }
    
    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "availableFilters") {
            let allFilterNames = CIFilter.filterNames(inCategories: nil)
            return result(allFilterNames)
        }
        
        result(FlutterError())
    }
    
}
