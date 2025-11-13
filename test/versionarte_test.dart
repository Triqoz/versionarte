import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:versionarte/versionarte.dart';

class MockVersionarteProvider extends Mock implements VersionarteProvider {}

void main() {
  late MockVersionarteProvider mockVersionarteProvider;

  setUp(() {
    mockVersionarteProvider = MockVersionarteProvider();

    when(() => mockVersionarteProvider.getDistributionManifest())
        .thenThrow(Error());
  });

  // Test case for making sure that errors are not caught, given that errors
  // should be handled by the developer.
  test('Errors are not caught', () {
    expect(
      () async => Versionarte.check(
        versionarteProvider: mockVersionarteProvider,
      ),
      throwsA(isA<Error>()),
    );
  });
}
