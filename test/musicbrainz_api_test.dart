import 'package:musicbrainz_api/musicbrainz_api.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final mbApi = MusicBrainzApi({
      'appName': 'test-app',
      'appVersion': '0.1.0',
      'appContactInfo': 'user@mail.org' // Or URL to application home page
    });

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      print(mbApi.getArtist('8da127cc-c432-418f-b356-ef36210d82ac'));
    });
  });
}
