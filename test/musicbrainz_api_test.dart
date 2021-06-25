import 'package:http/http.dart';
import 'package:musicbrainz_api/musicbrainz_api.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    var mbApi =
        MusicBrainzApi(Authentication(name: 'text', version: '0.1'));

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () async {
      print((await mbApi.getEntity('artist', '8da127cc-c432-418f-b356-ef36210d82ac')).body);
    });
  });
}
