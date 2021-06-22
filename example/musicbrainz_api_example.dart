import 'dart:html';

import 'package:musicbrainz_api/musicbrainz_api.dart';

void main() {
  final mbApi = MusicBrainzApi({
      'appName': 'test-app',
      'appVersion': '0.1.0',
      'appContactInfo': 'user@mail.org' // Or URL to application home page
    });

  querySelector('.wrapper')?.appendText(mbApi.getArtist('8da127cc-c432-418f-b356-ef36210d82ac'));
}
