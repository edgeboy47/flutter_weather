import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/weather/data/services/location_service.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';

class MockLocation extends Mock implements Location {}
class MockLocationData extends Mock implements LocationData {}

void main() {
  group('LocationService:', () {
    group('getLocation - ', () {
      late LocationService locationService;
      late MockLocation mockLocation;

      setUpAll(() {
        mockLocation = MockLocation();
      });

      setUp(() {
        locationService = LocationService(location: mockLocation);
      });

      test('When service is not enabled', () async {
        // ARRANGE
        when(() => mockLocation.serviceEnabled())
            .thenAnswer((_) async => false);

        when(() => mockLocation.requestService())
            .thenAnswer((_) async => false);

        // ACT
        final location = await locationService.getLocation();

        // ASSERT
        expect(location, isNull);
      });

      test('When service is enabled and permission is not granted', () async {
        // ARRANGE
        when(() => mockLocation.serviceEnabled()).thenAnswer((_) async => true);
        when(() => mockLocation.hasPermission())
            .thenAnswer((_) async => PermissionStatus.denied);
        when(() => mockLocation.requestPermission())
            .thenAnswer((_) async => PermissionStatus.denied);

        // ACT
        final location = await locationService.getLocation();

        // ASSERT
        expect(location, isNull);
      });

      test('When service is enabled and permission is granted', () async {
        // ARRANGE
        when(() => mockLocation.serviceEnabled()).thenAnswer((_) async => true);
        when(() => mockLocation.hasPermission())
            .thenAnswer((_) async => PermissionStatus.granted);
        when(() => mockLocation.getLocation())
            .thenAnswer((_) async => MockLocationData());

        // ACT
        final location = await locationService.getLocation();

        // ASSERT
        expect(location, isA<LocationData>());
      });
    });
  });
}
