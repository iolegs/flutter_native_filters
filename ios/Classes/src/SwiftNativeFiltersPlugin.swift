import Flutter
import UIKit

public class SwiftNativeFiltersPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftNativeFiltersPlugin(messenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: instance.filterFactory.methodChannel)
    }
    
    let filterFactory: NativeFilterFactory
    
    init(messenger: FlutterBinaryMessenger) {
        filterFactory = NativeFilterFactory(messenger: messenger)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        filterFactory.handle(call, result: result)
    }
}
