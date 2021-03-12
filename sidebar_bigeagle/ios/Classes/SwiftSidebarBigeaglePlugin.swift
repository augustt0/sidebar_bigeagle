import Flutter
import UIKit

public class SwiftSidebarBigeaglePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sidebar_bigeagle", binaryMessenger: registrar.messenger())
    let instance = SwiftSidebarBigeaglePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
