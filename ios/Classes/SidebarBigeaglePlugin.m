#import "SidebarBigeaglePlugin.h"
#if __has_include(<sidebar_bigeagle/sidebar_bigeagle-Swift.h>)
#import <sidebar_bigeagle/sidebar_bigeagle-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sidebar_bigeagle-Swift.h"
#endif

@implementation SidebarBigeaglePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSidebarBigeaglePlugin registerWithRegistrar:registrar];
}
@end
