import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sidebar_bigeagle/sidebar_bigeagle.dart';

void main() {
  const MethodChannel channel = MethodChannel('sidebar_bigeagle');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SidebarBigeagle.platformVersion, '42');
  });
}
